# require 'twilio-ruby'

# @account_sid = "AC8bd1fc44d1bd8a789dd7c5a915beb52a" # Your Test Account SID from www.twilio.com/console/settings
# @auth_token = "7014e2bb49db18eb5cdf169551c56f70"   # Your Test Auth Token from www.twilio.com/console/settings

# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: "Hello from Ruby",
#     to: "+44 07850422328",    # Replace with your phone number
#     from: "+13208531631")  # Use this Magic Number for creating SMS

# puts message.sid

# $LOAD_PATH << File.dirname(__FILE__)
# require "dish.rb"
# require 'menu.rb'

puts ENV['MY_NUMBER']
puts ENV['TWILIO_SID']
puts ENV['TWILIO_TOKEN']

