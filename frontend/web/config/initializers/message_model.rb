module Messaging
  module MessageModel
    extend ActiveSupport::Concern
    include MessageModel::HybridModel
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Naming
    include ActiveModel::Serializers::JSON
    include ActiveModel::Serializers::Xml

    def find(criteria)
      @properties = send_message(criteria).first
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