require 'test_helper'          

class ActivitiesTest < ActionDispatch::IntegrationTest 
  def test_activities_comment
    api_call(:post, '/api/v1/activity/:id/comment', id: 2, token: "2a25980982484222dc0ba9471611a9da6e51fad4", message: "This is awesome") do |doc|
      doc.description = "Comment on an activity:
        curl -X POST http://wael.docpoint.com/api/v1/activity/5/comment -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4&message=This is awesome'"
      assert_response :success 
    end
  end

  def test_activities_like
    api_call(:post, '/api/v1/activity/:id/like', id: 7, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Like on an activity:
        curl -X POST http://wael.docpoint.com/api/v1/activity/7/like -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_activities_get_news_feed
    api_call(:get, '/api/v1/activities', token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get news feed (default page=1 and per_page=10):
        curl -X GET http://wael.docpoint.com/api/v1/activities -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_activities_get_news_feed_with_pages
    api_call(:get, '/api/v1/activities', page: 2, per_page:5, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get news feed with pages:
        curl -X GET http://wael.docpoint.com/api/v1/activities -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4&page=2&per_page=5'"
      assert_response :success 
    end
  end
end
