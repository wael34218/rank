require 'test_helper'          

class FriendsTest < ActionDispatch::IntegrationTest 
  def test_adding_friends
    api_call(:post, '/api/v1/friends', "friends[0][phone]"=>'+962791231234123', "friends[0][first_name]"=> "Troll", "friends[0][last_name]"=> "Warlord", "friends[1][phone]"=>'+962791231234124', "friends[1][first_name]"=> "NoPanda", "friends[1][last_name]"=> "NoMore", "token"=>"2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Creating Friends Records:
        curl -X POST http://rank1.herokuapp.com/api/v1/friends -d \"friends[0][phone]=12564234234&friends[0][first_name]=Life&friends[0][last_name]=WithoutPandas&friends[1][phone]=125642345234&friends[1][first_name]=Black&friends[1][last_name]=Hitler&token=2a25980982484222dc0ba9471611a9da6e51fad4\""
      assert_response :success 
    end
  end

  def test_update_friend_by_id
    api_call(:patch, '/api/v1/friend', id: 2, rank: 4, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Adding rank to a new friend:
        curl -X PATCH http://rank1.herokuapp.com/api/v1/friends -d 'id=2&rank=3&token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_update_friend_by_phone
    api_call(:patch, '/api/v1/friend', phone: "+962-771231234", rank: 2, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Updating friends rank using phone number"
      assert_response :success
    end
  end

  def test_update_friend_not_found
    api_call(:patch, '/api/v1/friend', id: 23, rank: 4, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "If friend information is incorrect"
      assert_response :not_found
    end
  end
end
