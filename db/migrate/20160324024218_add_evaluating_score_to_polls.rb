class AddEvaluatingScoreToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :total_score, :integer, :default => 0
  end
end
