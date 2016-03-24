class Form < ApplicationRecord
  validates :name, presence: true
  validates :score_category, presence: true, numericality: { only_integer: true }
  has_many :formquestions, :dependent => :destroy
end
