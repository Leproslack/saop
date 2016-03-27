class Newquestion < ApplicationRecord
  validates :new_question_name, presence: true
  validates :new_question_score, presence: true, numericality: { only_integer: true }, length: { in: 0..2 }
  belongs_to :newcategory, optional: true

  def self.calculate_total_score_of_category(newcategory)
    new_category_score = newcategory.newquestions.sum(:new_question_score)
    newcategory.update!(new_category_score: new_category_score)
  end

  def self.update_total_score_of_category_after_destroy(newcategory, newquestion)
    new_category_score = newcategory.new_category_score - newquestion.new_question_score
    newcategory.update!(new_category_score: new_category_score)
  end

end
