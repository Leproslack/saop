class Newquestion < ApplicationRecord
  validates :new_question_name, presence: true
  validates :new_question_score, presence: true, numericality: { only_integer: true }, length: { in: 0..2 }
  belongs_to :newcategory, optional: true
end
