class Template < ApplicationRecord
  has_many :template_fields, :dependent => :destroy
  accepts_nested_attributes_for :template_fields,:reject_if => lambda { |a| a[:question].blank? && a[:score].blank? }, :allow_destroy => true

  def self.calculate_total_score(template)
    new_category_score = newcategory.newquestions.sum(:new_question_score)
    newcategory.update!(new_category_score: new_category_score)
  end
end
