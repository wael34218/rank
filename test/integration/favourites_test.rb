require 'test_helper'          

class FavouritesTest < ActionDispatch::IntegrationTest 
  def test_favourite_create
    api_call(:post, '/api/v1/favourite', title: 'Break their backs', favourite_category_id: '3', token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Create new favourite for your account:
        curl -X POST http://wael.docpoint.com/api/v1/favourite -d 'favourite_category_id=3&title=Break Their Backs&token=2a25980982484222dc0ba9471611a9da6e51fad4' -F photo=@kitchen.jpg"
      assert_response :success 
    end
  end

  def test_favourite_create_from_preset
    api_call(:post, '/api/v1/favourite', favourite_preset_id: 1, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Select a favourite from a preset:
        curl -X POST http://wael.docpoint.com/api/v1/favourite -d 'favourite_preset_id=1&token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_favourite_update
    api_call(:patch, '/api/v1/favourite/:id', id:4, title: 'Dionysus', token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Update a favourite:
        curl -X PATCH http://wael.docpoint.com/api/v1/favourite/4 -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4&title=Dionysus'"
      assert_response :success 
    end
  end

  def test_favourite_delete
    api_call(:delete, '/api/v1/favourite/:id', id:4, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Delete a favourite:
        curl -X DELETE http://wael.docpoint.com/api/v1/favourite/4 -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4&title=Dionysus'"
      assert_response :success 
    end
  end

  def test_favourite_index
    api_call(:get, '/api/v1/favourites', token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get my favourite:
        curl -X GET http://wael.docpoint.com/api/v1/favourites -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_favourite_index_for_friend
    api_call(:get, '/api/v1/favourites', account_id: 1, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get favourites for a friend:
        curl -X GET http://wael.docpoint.com/api/v1/favourites -d 'account_id=1&token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_favourite_index_for_friend_category
    api_call(:get, '/api/v1/favourites', favourite_category_id:1, account_id: 1, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get favourites of a friend for a specific category:
        curl -X GET http://wael.docpoint.com/api/v1/favourites -d 'favourite_category_id=1&account_id=1&token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_favourite_categories
    api_call(:get, '/api/v1/favourite/categories', token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get all favourite categories:
        curl -X GET http://wael.docpoint.com/api/v1/favourite/categories -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_favourite_presets
    api_call(:get, '/api/v1/favourite/category/:id/presets', id:2, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Get favourite presets for certain category:
        curl -X GET http://wael.docpoint.com/api/v1/favourite/:id/presets -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

end
