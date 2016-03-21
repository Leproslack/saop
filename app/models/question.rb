class Question < ApplicationRecord
  belongs_to :category, optional: true
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers
end
