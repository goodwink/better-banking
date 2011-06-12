require "./backend.rb"

Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }

Thread.new { EM.run }
 
AMQP.start do
  mq = MQ.new
  mq.prefetch(1)
  inquiry_topic = mq.topic("account_history_inquiry")
  queue = mq.queue("account_history_inquiry_queue")
  queue.bind(inquiry_topic, :key => $config["institution_id"])
  
  mq = MQ.new
  rsp_topic = mq.topic("responses")
  
  json = ActiveSupport::JSON
  
  db = EM::Mongo::Connection.new.db($config["database"])
  account_history = db.collection("account_history")
 
  queue.subscribe(:ack => true) do |header, msg|
    inquiry = json.decode(msg)
    routing_key = inquiry.delete("routing_key")
    
    history = account_history.find(inquiry)
    
    rsp_topic.publish(json.encode(history), :routing_key => routing_key)
    
    header.ack
  end

end