require 'test_helper'

class FormbuildersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formbuilder = formbuilders(:one)
  end

  test "should get index" do
    get formbuilders_url
    assert_response :success
  end

  test "should get new" do
    get new_formbuilder_url
    assert_response :success
  end

  test "should create formbuilder" do
    assert_difference('Formbuilder.count') do
      post formbuilders_url, params: { formbuilder: { category: @formbuilder.category } }
    end

    assert_redirected_to formbuilder_path(Formbuilder.last)
  end

  test "should show formbuilder" do
    get formbuilder_url(@formbuilder)
    assert_response :success
  end

  test "should get edit" do
    get edit_formbuilder_url(@formbuilder)
    assert_response :success
  end

  test "should update formbuilder" do
    patch formbuilder_url(@formbuilder), params: { formbuilder: { category: @formbuilder.category } }
    assert_redirected_to formbuilder_path(@formbuilder)
  end

  test "should destroy formbuilder" do
    assert_difference('Formbuilder.count', -1) do
      delete formbuilder_url(@formbuilder)
    end

    assert_redirected_to formbuilders_path
  end
end
