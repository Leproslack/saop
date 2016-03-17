require 'test_helper'

class QbuildersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qbuilder = qbuilders(:one)
  end

  test "should get index" do
    get qbuilders_url
    assert_response :success
  end

  test "should get new" do
    get new_qbuilder_url
    assert_response :success
  end

  test "should create qbuilder" do
    assert_difference('Qbuilder.count') do
      post qbuilders_url, params: { qbuilder: { name: @qbuilder.name } }
    end

    assert_redirected_to qbuilder_path(Qbuilder.last)
  end

  test "should show qbuilder" do
    get qbuilder_url(@qbuilder)
    assert_response :success
  end

  test "should get edit" do
    get edit_qbuilder_url(@qbuilder)
    assert_response :success
  end

  test "should update qbuilder" do
    patch qbuilder_url(@qbuilder), params: { qbuilder: { name: @qbuilder.name } }
    assert_redirected_to qbuilder_path(@qbuilder)
  end

  test "should destroy qbuilder" do
    assert_difference('Qbuilder.count', -1) do
      delete qbuilder_url(@qbuilder)
    end

    assert_redirected_to qbuilders_path
  end
end
