class Form < ApplicationRecord
  has_many :formquestions, :dependent => :destroy
end
