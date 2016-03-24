class AddEvaluatingScoreToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :category_score, :integer, :default => 0
  end
end
