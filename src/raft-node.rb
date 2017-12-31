require 'bunny'

puts "We're in the ruby script, hooray. Let's check if we have bunny working..."

node_number = Random.new.rand(500)
time_created = Time.now

puts "This node is number #{node_number}"
STDOUT.sync = true
sleep 5
conn = Bunny.new("amqp://guest:guest@rabbit:5672")
conn.start

channel  = conn.create_channel
exchange   = channel.fanout("heartbeats")

# Create subscriber code for messages
channel.queue("node_#{node_number}", :auto_delete => true).bind(exchange).subscribe do |delivery_info, metadata, payload|
    puts "node #{node_number} created at #{time_created} has received a heartbeat message. payload: #{payload}"
end

loop do
  # Publish a message to the exchange
  exchange.publish("node #{node_number} has published a heartbeat message! This node created at #{time_created}")
  sleep 7
end
conn.close
