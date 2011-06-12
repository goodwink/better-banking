module Messaging
  module MessageModel
    extend ActiveSupport::Concern
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Naming
    include ActiveModel::Serializers::JSON
    include ActiveModel::Serializers::Xml

    def setup_messaging(topic_name, routing_key)
      @mq = Bunny.new(:logging => true)
      @mq.start

      @topic = @mq.exchange(topic_name, :type => :topic)
      @receive_topic = @mq.exchange("responses", :type => :topic)
      @guid = MessageModel.guid

      @routing_key = routing_key
      @json = ActiveSupport::JSON
    end

    def send_message(message)
      response_key = @routing_key + @guid + message.hash.to_s
      message[:routing_key] = response_key
      @topic.publish(@json.encode(message), :key => @routing_key)
      rsp_queue = @mq.queue(response_key)
      rsp_queue.bind(@receive_topic, :key => response_key)

      back_off = 0.01
      total_wait = 0

      while (message = rsp_queue.pop(:ack => true))[:payload] == :queue_empty do
        sleep back_off
        total_wait += back_off

        if total_wait > 30
          break
        end

        back_off *= 10
      end

      if message == :queue_empty
        [{}]
      else
        rsp_queue.ack
        reply = @json.decode(message[:payload])
      end
    end

    def find(criteria)
      @properties = send_message(criteria).first
    end

    def self.guid
      SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")
    end

    def method_missing(method_sym, *arguments, &block)
      if @properties && @properties["#{method_sym}"] != nil
        define_dynamic_accessor(method_sym)
        send(method_sym)
      else
        super
      end
    end

    protected

    def define_dynamic_accessor(accessor)
      class_eval <<-RUBY
      def #{accessor}
        @properties["#{accessor}"]
      end
      RUBY
    end

  end
end