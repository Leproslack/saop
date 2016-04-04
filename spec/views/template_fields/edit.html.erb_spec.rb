require 'rails_helper'

RSpec.describe "template_fields/edit", :type => :view do
  before(:each) do
    @template_field = assign(:template_field, TemplateField.create!(
      :question => "MyString",
      :score => 1,
      :template_id => 1
    ))
  end

  it "renders the edit template_field form" do
    render

    assert_select "form[action=?][method=?]", template_field_path(@template_field), "post" do

      assert_select "input#template_field_question[name=?]", "template_field[question]"

      assert_select "input#template_field_score[name=?]", "template_field[score]"

      assert_select "input#template_field_template_id[name=?]", "template_field[template_id]"
    end
  end
end
