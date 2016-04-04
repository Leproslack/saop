require 'rails_helper'

RSpec.describe "template_fields/index", :type => :view do
  before(:each) do
    assign(:template_fields, [
      TemplateField.create!(
        :question => "Question",
        :score => 1,
        :template_id => 2
      ),
      TemplateField.create!(
        :question => "Question",
        :score => 1,
        :template_id => 2
      )
    ])
  end

  it "renders a list of template_fields" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
