class AddEvaluatingScoreToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_score, :integer, :default => 0
  end
end
