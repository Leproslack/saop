class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer_rate
      t.text :answer_comment

      t.timestamps
    end
    add_index :answers, :answer_rate
  end
end
