require 'test_helper'          

class AccountsTest < ActionDispatch::IntegrationTest 
  def test_account_registration
    api_call(:post, '/api/v1/account', phone:'+962791231234123', first_name: "Troll", last_name: "Warlord", nickname: "Chinese") do |doc| 
      doc.description = "Successful Registration:
        curl -X POST http://wael.docpoint.com/api/v1/accounts -F \"phone=225643434234&first_name=damingo&last_name=Rodriguez&nickname=bullfighterde\" -F avatar=@kitchen.jpg"
      assert_response :success 
    end
  end
end
