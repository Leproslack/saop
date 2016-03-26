class Newcategory < ApplicationRecord
  validates :new_category_name, presence: true
  validates :new_category_score, presence: true, numericality: { only_integer: true }
  has_many :newquestions, :dependent => :destroy
end
