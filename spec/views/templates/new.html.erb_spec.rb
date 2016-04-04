require 'rails_helper'

RSpec.describe "templates/new", :type => :view do
  before(:each) do
    assign(:template, Template.new(
      :category => "MyString",
      :score => 1
    ))
  end

  it "renders new template form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input#template_category[name=?]", "template[category]"

      assert_select "input#template_score[name=?]", "template[score]"
    end
  end
end
