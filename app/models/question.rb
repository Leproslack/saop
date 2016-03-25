class Question < ApplicationRecord
  validates :question_score, presence: true, numericality: { only_integer: true }
  validates :question_rate, presence: true, numericality: { only_integer: true }
  validates :content, presence: true
  belongs_to :category, optional: true
end
