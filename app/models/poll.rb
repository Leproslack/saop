class Poll < ApplicationRecord
  has_many :categories, :dependent => :destroy
  accepts_nested_attributes_for :categories
  after_commit :calculate_score_result, on: [:create, :update]

  def self.get_attributes_from_template(poll)
    poll.update_attributes(score_init: Template.sum(:score), name: "P#{Time.now.strftime("%d%m%H%M%S")}")
    Template.all.each do |cat|
      if cat.score != 0
        category = poll.categories.new(name: cat.category, score_init: cat.score )
          cat.template_fields.each do |quest|
            category.questions.new(content: quest.question, score_init: quest.score)
          end
      end
    end
  end

  def calculate_score_result
    categories.each {|q| q.update!(score_result: q.questions.sum(:score_result))}
    update_attribute :score_result, categories.sum(:score_result)
  end
  
end
