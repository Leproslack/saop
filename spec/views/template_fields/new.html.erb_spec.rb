require 'rails_helper'

RSpec.describe "template_fields/new", :type => :view do
  before(:each) do
    assign(:template_field, TemplateField.new(
      :question => "MyString",
      :score => 1,
      :template_id => 1
    ))
  end

  it "renders new template_field form" do
    render

    assert_select "form[action=?][method=?]", template_fields_path, "post" do

      assert_select "input#template_field_question[name=?]", "template_field[question]"

      assert_select "input#template_field_score[name=?]", "template_field[score]"

      assert_select "input#template_field_template_id[name=?]", "template_field[template_id]"
    end
  end
end
