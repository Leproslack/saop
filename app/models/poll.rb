class Poll < ApplicationRecord
  validates :name, presence: true
  validates :total_score, presence: true, numericality: { only_integer: true }
  has_many :categories, :dependent => :destroy
  accepts_nested_attributes_for :categories



  def self.calculate_rate(poll)
    poll.categories.each do |cat|
      rate = cat.questions.sum(:question_rate)
      cat.update(category_rate: rate)
    end
    poll_rate = poll.categories.sum(:category_rate)
    poll.update!(poll_rate: poll_rate)
  end

  def self.get_attributes_from_template(poll)
    poll.total_score = Template.sum(:score)
    poll.name = "P#{Time.now.strftime("%d%m%H%M%S")}"
    Template.all.each do |cat|
      if cat.score != 0
        category = poll.categories.new(category_name: cat.category, category_score: cat.score )
          cat.template_fields.each do |quest|
            question = category.questions.new(content: quest.question, question_score: quest.score)
          end
      end    
    end
  end

end
