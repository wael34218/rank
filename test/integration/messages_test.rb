require 'test_helper'

class MessagesTest < ActionDispatch::IntegrationTest 
  def test_message_create
    api_call(:post, '/api/v1/message', message: 'Break their backs', target_id: '6', token: "2a25980982484222dc0ba9471611a9da6e51fad4", "private"=>"true") do |doc|
      doc.description = "Create new message sent to account id 6:
        curl -X POST http://wael.docpoint.com/api/v1/message -d 'message=BreakTheirBacks&private=true&target_id=6& token=2a25980982484222dc0ba9471611a9da6e51fad4' -F photo=@kitchen.jpg"
      assert_response :success 
    end
  end
end
