require 'rails_helper'

RSpec.describe Poll, :type => :model do
  it "calculate total score result" do
    category1 = FactoryGirl.create(:category)
    category2 = FactoryGirl.create(:category)

    question1 = FactoryGirl.create(:question, { score_result: 2 }  )
    question2 = FactoryGirl.create(:question, { score_result: 2 }  )
    question3 = FactoryGirl.create(:question, { score_result: 1 }  )
    question4 = FactoryGirl.create(:question, { score_result: 2 }  )

    poll = FactoryGirl.create(:poll)

    category1.questions << question1
    category1.questions << question2
    category2.questions << question3
    category2.questions << question4

    poll.categories << category1
    poll.categories << category2

    poll.calculate_score_result
    expect(category1.score_result).to eq(4)
    expect(category2.score_result).to eq(3)
    expect(poll.score_result).to eq(7)
  end

end
