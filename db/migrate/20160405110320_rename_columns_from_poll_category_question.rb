class RenameColumnsFromPollCategoryQuestion < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :category_name, :name
    rename_column :categories, :category_rate, :score_result
    rename_column :categories, :category_score, :score_init
    rename_column :polls, :total_score, :score_init
    rename_column :polls, :poll_rate, :score_result
    rename_column :questions, :question_rate, :score_result
    rename_column :questions, :question_score, :score_init
    rename_column :questions, :question_comment, :comment
  end
end
