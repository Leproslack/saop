class Category < ApplicationRecord
  validates :score_init, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  belongs_to :poll, optional: true
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions
end
