class Template < ApplicationRecord
  has_many :template_fields, :dependent => :destroy
  accepts_nested_attributes_for :template_fields,:reject_if => lambda { |a| a[:question].blank? && a[:score].blank? }, :allow_destroy => true

  def self.calculate_score_init(template)
    score_init = template.template_fields.sum(:score)
    template.update!(score: score_init)
  end

  def self.update_score_after_destroy(template, template_fields)
    updated_score = template.score - template_fields.score
    template.update!(score: updated_score)
  end
end
