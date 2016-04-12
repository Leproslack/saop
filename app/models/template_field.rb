class TemplateField < ApplicationRecord
  validates :question, presence: true
  validates :score, presence: true, length: { in: 1..2 }
  belongs_to :template, optional: true
  
end
