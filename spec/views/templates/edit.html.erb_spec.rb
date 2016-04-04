require 'rails_helper'

RSpec.describe "templates/edit", :type => :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :category => "MyString",
      :score => 1
    ))
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(@template), "post" do

      assert_select "input#template_category[name=?]", "template[category]"

      assert_select "input#template_score[name=?]", "template[score]"
    end
  end
end
