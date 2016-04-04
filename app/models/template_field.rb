class TemplateField < ApplicationRecord
  belongs_to :template, optional: true
end
