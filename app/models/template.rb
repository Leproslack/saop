class Template < ApplicationRecord
  has_many :template_fields, :dependent => :destroy
  accepts_nested_attributes_for :template_fields,:reject_if => lambda { |a| a[:question].blank? && a[:score].blank? }, :allow_destroy => true

end
