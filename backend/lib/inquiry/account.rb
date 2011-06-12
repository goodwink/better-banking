require "./backend.rb"

Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }

Thread.new { EM.run }
 
AMQP.start do
  mq = MQ.new
  mq.prefetch(1)
  inquiry_topic = mq.topic("account_inquiry")
  queue = mq.queue("account_inquiry_queue")
  queue.bind(inquiry_topic, :key => $config["institution_id"])
  
  mq = MQ.new
  rsp_topic = mq.topic("responses")
  
  json = ActiveSupport::JSON
  
  db = EM::Mongo::Connection.new.db($config["database"])
  accounts = db.collection("accounts")
 
  queue.subscribe(:ack => true) do |header, msg|
    inquiry = json.decode(msg)
    routing_key = inquiry.delete("routing_key")
    
    accounts.find(inquiry) do |account|
      rsp_topic.publish(json.encode(account), :routing_key => routing_key)
    end
    
    header.ack
  end

end
