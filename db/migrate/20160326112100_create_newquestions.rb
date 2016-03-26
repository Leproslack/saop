class CreateNewquestions < ActiveRecord::Migration[5.0]
  def change
    create_table :newquestions do |t|
      t.string :new_question_name
      t.integer :new_question_score, limit: 2, default: 0
      t.integer :newcategory_id

      t.timestamps
    end
  end
end
