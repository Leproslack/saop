require 'test_helper'

class NewcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newcategory = newcategories(:one)
  end

  test "should get index" do
    get newcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_newcategory_url
    assert_response :success
  end

  test "should create newcategory" do
    assert_difference('Newcategory.count') do
      post newcategories_url, params: { newcategory: { new_category_name: @newcategory.new_category_name, new_category_score: @newcategory.new_category_score } }
    end

    assert_redirected_to newcategory_path(Newcategory.last)
  end

  test "should show newcategory" do
    get newcategory_url(@newcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_newcategory_url(@newcategory)
    assert_response :success
  end

  test "should update newcategory" do
    patch newcategory_url(@newcategory), params: { newcategory: { new_category_name: @newcategory.new_category_name, new_category_score: @newcategory.new_category_score } }
    assert_redirected_to newcategory_path(@newcategory)
  end

  test "should destroy newcategory" do
    assert_difference('Newcategory.count', -1) do
      delete newcategory_url(@newcategory)
    end

    assert_redirected_to newcategories_path
  end
end
