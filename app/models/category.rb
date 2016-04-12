class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :poll, optional: true
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions

  # after_commit    :calculate_category_score_result
  #
  # def calculate_category_score_result
  #   if Poll.exists?(poll_id)
  #     score_result = Poll.find(poll_id).categories.sum(:score_result)
  #     Poll.find(poll_id).update!(score_result: score_result)
  #   end
  # end
end
