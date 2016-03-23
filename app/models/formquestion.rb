class Formquestion < ApplicationRecord
  belongs_to :form, optional: true
end
