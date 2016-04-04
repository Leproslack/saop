require 'rails_helper'

RSpec.describe "template_fields/show", :type => :view do
  before(:each) do
    @template_field = assign(:template_field, TemplateField.create!(
      :question => "Question",
      :score => 1,
      :template_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
