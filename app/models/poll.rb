class Poll < ApplicationRecord
  validates :name, presence: true
  validates :total_score, presence: true, numericality: { only_integer: true }
  has_many :categories, :dependent => :destroy
  accepts_nested_attributes_for :categories
end
