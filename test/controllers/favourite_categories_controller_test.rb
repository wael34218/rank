require 'test_helper'

class FavouriteCategoriesControllerTest < ActionController::TestCase
  setup do
    @favourite_category = favourite_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favourite_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favourite_category" do
    assert_difference('FavouriteCategory.count') do
      post :create, favourite_category: { title: @favourite_category.title }
    end

    assert_redirected_to favourite_category_path(assigns(:favourite_category))
  end

  test "should show favourite_category" do
    get :show, id: @favourite_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favourite_category
    assert_response :success
  end

  test "should update favourite_category" do
    patch :update, id: @favourite_category, favourite_category: { title: @favourite_category.title }
    assert_redirected_to favourite_category_path(assigns(:favourite_category))
  end

  test "should destroy favourite_category" do
    assert_difference('FavouriteCategory.count', -1) do
      delete :destroy, id: @favourite_category
    end

    assert_redirected_to favourite_categories_path
  end
end
