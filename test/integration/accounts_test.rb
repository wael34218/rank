require 'test_helper'          

class AccountsTest < ActionDispatch::IntegrationTest 
  def test_account_registration
    api_call(:post, '/api/v1/account', phone:'+962791231234123', first_name: "Troll", last_name: "Warlord", nickname: "Chinese") do |doc| 
      doc.description = "Successful Registration:
        curl -X POST http://wael.docpoint.com/api/v1/accounts -F \"phone=225643434234&first_name=damingo&last_name=Rodriguez& nickname=bullfighterde\" -F avatar=@kitchen.jpg"
      assert_response :success 
    end
  end

  def test_account_set_clicks
    api_call(:post, '/api/v1/account/tags', token: '2a25980982484222dc0ba9471611a9da6e51fad4', tags: 'subtle porn,black label society') do |doc|
      doc.description = "Tags list are comma separated:
        curl -X POST http://wael.docpoint.com/api/v1/account/tags -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4&tags=subtle porn,black label society'"
      assert_response :success
    end
  end

  def test_account_get_tag_leaders
    api_call(:get, '/api/v1/account/tag_leaders', token: '2a25980982484222dc0ba9471611a9da6e51fad4', tag: 'subtle porn') do |doc|
      doc.description = "Get leaderboard of certain tag:
        curl -X GET http://wael.docpoint.com/api/v1/account/tag_leaders -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4&tag=subtle porn'"
      assert_response :success
    end
  end

  def test_account_get_my_friends
    api_call(:get, '/api/v1/account/friends', token: '2a25980982484222dc0ba9471611a9da6e51fad4') do |doc|
      doc.description = "Get all my friends:
        curl -X GET http://wael.docpoint.com/api/v1/account/friends -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success
    end
  end

  def test_account_get_ranked_friends
    api_call(:get, '/api/v1/account/:id/ranked_friends', token: '2a25980982484222dc0ba9471611a9da6e51fad4',id:5) do |doc|
      doc.description = "Get ranked friends for some account:
        curl -X GET http://wael.docpoint.com/api/v1/account/5/ranked_friends -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4&account_id=5'"
      assert_response :success
    end
  end

end
