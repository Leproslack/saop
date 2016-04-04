require 'rails_helper'

RSpec.describe "templates/show", :type => :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :category => "Category",
      :score => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/1/)
  end
end
