class AddEvaluateCategoryTotal < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :evaluate_category, :integer, :default => 0
  end
end
