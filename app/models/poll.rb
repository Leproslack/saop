class Poll < ApplicationRecord
  validates :name, presence: true
  validates :score_init, presence: true, numericality: { only_integer: true }
  has_many :categories, :dependent => :destroy
  accepts_nested_attributes_for :categories

  def self.get_attributes_from_template(poll)
    poll.score_init = Template.sum(:score)
    poll.name = "P#{Time.now.strftime("%d%m%H%M%S")}"
    Template.all.each do |cat|
      if cat.score != 0
        category = poll.categories.new(name: cat.category, score_init: cat.score )
          cat.template_fields.each do |quest|
            question = category.questions.new(content: quest.question, score_init: quest.score)
          end
      end
    end
  end

end
