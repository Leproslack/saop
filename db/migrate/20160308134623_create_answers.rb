class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table    :answers do |t|
      t.integer     :answer_rate
      t.text        :answer_comment
      t.belongs_to  :question, index: true

      t.timestamps
    end
  end
end
