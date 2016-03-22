class Formbuilder < ApplicationRecord
  has_many :formquestions, :dependent => :destroy
end
