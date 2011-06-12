require "./backend.rb"

Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }

Thread.new { EM.run }
 
AMQP.start do
  count = 0
  mq = MQ.new
  inquiry_topic = mq.topic("account_inquiry")

  json = ActiveSupport::JSON

  puts "pid #{Process.pid} start sending messages"
 
  routing_key = Process.pid.to_s
 
  #sends messages periodically
  EM.add_periodic_timer(0.2) do
    puts "Sending inquiry with routing_key " + routing_key
    inquiry = {
      id: "10001",
      product_id: "20",
      institution_id: "123456780",
      routing_key: routing_key.to_s
    } 
    inquiry_topic.publish(json.encode(inquiry), :routing_key => "123456780")
  end
  
  mq = MQ.new
  response_topic = mq.topic("responses")
  rsp_queue = mq.queue(routing_key.to_s + "_rsp_queue")
  rsp_queue.bind(response_topic, :key => routing_key)
  
  puts "subscribing to responses"
  rsp_queue.subscribe(:ack => true) do |header, msg|
    puts msg
    header.ack
  end

end