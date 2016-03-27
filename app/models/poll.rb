class Poll < ApplicationRecord
  validates :name, presence: true
  validates :total_score, presence: true, numericality: { only_integer: true }
  has_many :categories, :dependent => :destroy
  accepts_nested_attributes_for :categories



  def self.calculate_rate(poll)
    poll_rate = 0
    poll.categories.each do |cat|
      rate = cat.questions.sum(:question_rate)
      poll.categories.where(category_name: cat.category_name).update(category_rate: rate)
      poll_rate += rate
    end
    poll.update!(poll_rate: poll_rate)
  end

  def self.get_attributes_from_template(poll)
    poll.total_score = Newcategory.sum(:new_category_score)
    poll.name = "Poll#{Time.now.strftime("%Y%d%m%H%M%S")}"
    Newcategory.all.each do |cat|
      category = poll.categories.new(category_name: cat.new_category_name, category_score: cat.new_category_score )
        cat.newquestions.each do |quest|
          question = category.questions.new(content: quest.new_question_name, question_score: quest.new_question_score)
        end
    end
  end

end
