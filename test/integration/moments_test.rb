require 'test_helper'          

class MomentsTest < ActionDispatch::IntegrationTest 
  def test_moment_create
    api_call(:post, '/api/v1/moment', message: 'Carting', target_id: 5, moment_category_id: '1', token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Create new moment with:
        curl -X POST http://wael.docpoint.com/api/v1/moment -d 'moment_category_id=3&moment_category_id=1&message=Break Their Backs&token=2a25980982484222dc0ba9471611a9da6e51fad4' -F photo=@kitchen.jpg"
      assert_response :success 
    end
  end

  def test_favourite_categories
    api_call(:get, '/api/v1/moment/categories', token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get all moment categories:
        curl -X GET http://wael.docpoint.com/api/v1/moment/categories -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end
end
