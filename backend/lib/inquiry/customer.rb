require "./backend.rb"

Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }

Thread.new { EM.run }
 
AMQP.start do
  mq = MQ.new
  mq.prefetch(1)
  inquiry_topic = mq.topic("customer_inquiry")
  queue = mq.queue("customer_inquiry_queue")
  queue.bind(inquiry_topic, :key => $config["institution_id"])
  
  mq = MQ.new
  rsp_topic = mq.topic("responses")
  
  json = ActiveSupport::JSON
  
  db = EM::Mongo::Connection.new.db($config["database"])
  customers = db.collection("customers")
 
  queue.subscribe(:ack => true) do |header, msg|
    inquiry = json.decode(msg)
    routing_key = inquiry.delete("routing_key")
    
    customers.find(inquiry) do |customer|
      rsp_topic.publish(json.encode(customer), :routing_key => routing_key)
    end
    
    header.ack
  end

end