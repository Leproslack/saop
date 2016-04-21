class AddQuestionRateAndCommentToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_rate, :integer
    add_column :questions, :question_comment, :text
  end
end
