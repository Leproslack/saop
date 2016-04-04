require 'rails_helper'

RSpec.describe "templates/index", :type => :view do
  before(:each) do
    assign(:templates, [
      Template.create!(
        :category => "Category",
        :score => 1
      ),
      Template.create!(
        :category => "Category",
        :score => 1
      )
    ])
  end

  it "renders a list of templates" do
    render
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
