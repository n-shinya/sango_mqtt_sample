require 'mqtt'

host = 'free.mqtt.shiguredo.jp'
port = 1883

print 'Topic Name?: '
topic = gets.chomp

MQTT::Client.connect(
  :remote_host => host,
  :remote_port => port,
  :username => ENV['MQTT_USERNAME'],
  :password => ENV['MQTT_PASSWORD']
) do |client|
  while true
   client.publish(topic, "HELLO! #{Time.now}", retain = true)
   sleep 5 
  end
end
