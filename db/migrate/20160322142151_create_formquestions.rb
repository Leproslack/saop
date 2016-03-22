class CreateFormquestions < ActiveRecord::Migration[5.0]
  def change
    create_table :formquestions do |t|
      t.string :question_build
      t.integer :formbuilder_id

      t.timestamps
    end
  end
end
