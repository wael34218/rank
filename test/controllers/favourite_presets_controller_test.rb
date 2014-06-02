require 'test_helper'

class FavouritePresetsControllerTest < ActionController::TestCase
  setup do
    @favourite_preset = favourite_presets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favourite_presets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favourite_preset" do
    assert_difference('FavouritePreset.count') do
      post :create, favourite_preset: { category_id: @favourite_preset.category_id, title: @favourite_preset.title }
    end

    assert_redirected_to favourite_preset_path(assigns(:favourite_preset))
  end

  test "should show favourite_preset" do
    get :show, id: @favourite_preset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favourite_preset
    assert_response :success
  end

  test "should update favourite_preset" do
    patch :update, id: @favourite_preset, favourite_preset: { category_id: @favourite_preset.category_id, title: @favourite_preset.title }
    assert_redirected_to favourite_preset_path(assigns(:favourite_preset))
  end

  test "should destroy favourite_preset" do
    assert_difference('FavouritePreset.count', -1) do
      delete :destroy, id: @favourite_preset
    end

    assert_redirected_to favourite_presets_path
  end
end
