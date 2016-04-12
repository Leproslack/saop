class TemplateField < ApplicationRecord
  validates :question, presence: true
  validates :score, presence: true, length: { in: 1..2 }
  belongs_to :template, optional: true

  after_commit    :calculate_score_init

  def calculate_score_init
    if Template.exists?(template_id)
      score_init = Template.find(template_id).template_fields.sum(:score)
      Template.find(template_id).update!(score: score_init)
    end
  end

end
