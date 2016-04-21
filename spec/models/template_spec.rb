require 'rails_helper'

RSpec.describe Template, :type => :model do

  it "calculate total score" do
    question1 = FactoryGirl.create(:template_field)
    question2 = FactoryGirl.create(:template_field, { score: 2 } )
    question3 = FactoryGirl.create(:template_field, { score: 2 } )

    category = FactoryGirl.create(:template)
    category.template_fields << question1
    category.template_fields << question2
    category.template_fields << question3

    category.calculate_score_init
    expect(category.score).to eq(5)
  end
end
