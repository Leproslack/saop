class RenamePollIdFromQuestionsToCategoryId < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :poll_id, :category_id
  end
end
