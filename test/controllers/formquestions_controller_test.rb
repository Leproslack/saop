require 'test_helper'

class FormquestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formquestion = formquestions(:one)
  end

  test "should get index" do
    get formquestions_url
    assert_response :success
  end

  test "should get new" do
    get new_formquestion_url
    assert_response :success
  end

  test "should create formquestion" do
    assert_difference('Formquestion.count') do
      post formquestions_url, params: { formquestion: { form_id: @formquestion.form_id, question_name: @formquestion.question_name } }
    end

    assert_redirected_to formquestion_path(Formquestion.last)
  end

  test "should show formquestion" do
    get formquestion_url(@formquestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_formquestion_url(@formquestion)
    assert_response :success
  end

  test "should update formquestion" do
    patch formquestion_url(@formquestion), params: { formquestion: { form_id: @formquestion.form_id, question_name: @formquestion.question_name } }
    assert_redirected_to formquestion_path(@formquestion)
  end

  test "should destroy formquestion" do
    assert_difference('Formquestion.count', -1) do
      delete formquestion_url(@formquestion)
    end

    assert_redirected_to formquestions_path
  end
end
