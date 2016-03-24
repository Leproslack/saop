class Form < ApplicationRecord
  validates :name, presence: true
  validates :evaluate_total, presence: true, numericality: { only_integer: true }
  has_many :formquestions, :dependent => :destroy
end
