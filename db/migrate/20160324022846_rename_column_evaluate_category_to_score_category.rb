class RenameColumnEvaluateCategoryToScoreCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :forms, :evaluate_category, :score_category
  end
end
