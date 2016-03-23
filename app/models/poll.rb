class Poll < ApplicationRecord
  has_many :categories, :dependent => :destroy
  accepts_nested_attributes_for :categories
end
