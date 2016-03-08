class Category < ApplicationRecord
  belongs_to :poll
  has_many   :questions
end
