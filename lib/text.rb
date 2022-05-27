require 'twilio-ruby'

class SendText
  def run(number)
    eta = delivery_time(60)
    @account_sid = ENV['TWILIO_SID'] # Your Test Account SID from www.twilio.com/console/settings
    @auth_token = ENV['TWILIO_TOKEN']   # Your Test Auth Token from www.twilio.com/console/settings

    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{eta}",
        to: number,    # Replace with your phone number
        from: "+13208531631")  # Use this Magic Number for creating SMS

    puts message.sid
    end

  private

    def delivery_time(mins)
      @time = Time.now + (mins * 60)
      return @time.strftime("%H:%M")
    end
end

# dave = ENV['MY_NUMBER']
# test_1 = SendText.new
# test_1.run(dave)