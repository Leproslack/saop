class Question < ApplicationRecord
  belongs_to :category, optional: true
end
