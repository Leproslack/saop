class Category < ApplicationRecord
  belongs_to :poll, optional: true

  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions
end
