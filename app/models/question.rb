class Question < ApplicationRecord
  validates :score_init, presence: true, numericality: { only_integer: true }
  validates :score_result, presence: true, numericality: { only_integer: true }
  validates :content, presence: true
  belongs_to :category, optional: true

  after_commit    :calculate_category_score_result

  def calculate_category_score_result
    if Category.exists?(category_id)
      score_result = Category.find(category_id).questions.sum(:score_result)
      Category.find(category_id).update!(score_result: score_result)
    end
  end
end
