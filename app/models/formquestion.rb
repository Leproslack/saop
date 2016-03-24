class Formquestion < ApplicationRecord
  validates :question_name, presence: true
  validates :evaluate_method, presence: true, numericality: { only_integer: true }, length: { in: 0..2 }
  belongs_to :form, optional: true
end
