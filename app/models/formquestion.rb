class Formquestion < ApplicationRecord
  belongs_to :formbuilder, optional: true
end
