class Question < ApplicationRecord
  validates :score_init, presence: true, numericality: { only_integer: true }
  validates :score_result, presence: true, numericality: { only_integer: true }
  validates :content, presence: true
  belongs_to :category, optional: true
end
