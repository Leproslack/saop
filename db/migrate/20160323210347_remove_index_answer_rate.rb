class RemoveIndexAnswerRate < ActiveRecord::Migration[5.0]
  def change
    remove_index :answers, :answer_rate
  end
end
