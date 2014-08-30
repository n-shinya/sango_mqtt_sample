require 'mqtt'

host = 'free.mqtt.shiguredo.jp'
port = '1883'

print 'Topic Name?: '
topic = gets.chomp

abort if topic.empty?

MQTT::Client.connect(
  :remote_host => host,
  :remote_port => port,
  :username => ENV['MQTT_USERNAME'],
  :password => ENV['MQTT_PASSWORD']
) do |client|
  client.get(topic) do |topic, message|
    puts "Topic: #{topic}  Message: #{message}"
  end
end
