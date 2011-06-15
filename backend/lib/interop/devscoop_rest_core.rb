require "./backend.rb"

Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }

Thread.new { EM.run }
 
AMQP.start do
  mq = MQ.new
  mq.prefetch(1)
  core_topic = mq.topic("devscoop_rest_core")
  queue = mq.queue("devscoop_rest_core_queue")
  queue.bind(core_topic, :key => $config["institution_id"])
  
  mq = MQ.new
  rsp_topic = mq.topic("responses")
  
  json = ActiveSupport::JSON
  rest = RestClient::Resource.new 'http://localhost:3000'
 
  queue.subscribe(:ack => true) do |header, msg|
    request = json.decode(msg)
    routing_key = request.delete("routing_key")
    resource_type = request.delete("resource_type")
    
    # switch on resource type and perform appropriate rest action
    
    rsp_topic.publish(json.encode(account), :routing_key => routing_key)
    
    header.ack
  end

end