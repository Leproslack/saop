require 'test_helper'

class NewquestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newquestion = newquestions(:one)
  end

  test "should get index" do
    get newquestions_url
    assert_response :success
  end

  test "should get new" do
    get new_newquestion_url
    assert_response :success
  end

  test "should create newquestion" do
    assert_difference('Newquestion.count') do
      post newquestions_url, params: { newquestion: { new_question_name: @newquestion.new_question_name, new_question_score: @newquestion.new_question_score, newcategory_id: @newquestion.newcategory_id } }
    end

    assert_redirected_to newquestion_path(Newquestion.last)
  end

  test "should show newquestion" do
    get newquestion_url(@newquestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_newquestion_url(@newquestion)
    assert_response :success
  end

  test "should update newquestion" do
    patch newquestion_url(@newquestion), params: { newquestion: { new_question_name: @newquestion.new_question_name, new_question_score: @newquestion.new_question_score, newcategory_id: @newquestion.newcategory_id } }
    assert_redirected_to newquestion_path(@newquestion)
  end

  test "should destroy newquestion" do
    assert_difference('Newquestion.count', -1) do
      delete newquestion_url(@newquestion)
    end

    assert_redirected_to newquestions_path
  end
end
