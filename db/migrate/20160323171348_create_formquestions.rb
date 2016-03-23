class CreateFormquestions < ActiveRecord::Migration[5.0]
  def change
    create_table :formquestions do |t|
      t.string :question_name
      t.integer :form_id

      t.timestamps
    end
    add_index :formquestions, :form_id
  end
end
