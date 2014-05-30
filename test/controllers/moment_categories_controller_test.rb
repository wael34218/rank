require 'test_helper'

class MomentCategoriesControllerTest < ActionController::TestCase
  setup do
    @moment_category = moment_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moment_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moment_category" do
    assert_difference('MomentCategory.count') do
      post :create, moment_category: { text: @moment_category.text }
    end

    assert_redirected_to moment_category_path(assigns(:moment_category))
  end

  test "should show moment_category" do
    get :show, id: @moment_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moment_category
    assert_response :success
  end

  test "should update moment_category" do
    patch :update, id: @moment_category, moment_category: { text: @moment_category.text }
    assert_redirected_to moment_category_path(assigns(:moment_category))
  end

  test "should destroy moment_category" do
    assert_difference('MomentCategory.count', -1) do
      delete :destroy, id: @moment_category
    end

    assert_redirected_to moment_categories_path
  end
end
