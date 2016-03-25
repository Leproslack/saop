class Category < ApplicationRecord
  validates :category_score, presence: true, numericality: { only_integer: true }
  validates :category_name, presence: true
  belongs_to :poll, optional: true
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions
end
