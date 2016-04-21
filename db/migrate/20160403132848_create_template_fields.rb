class CreateTemplateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :template_fields do |t|
      t.string :question
      t.integer :score
      t.integer :template_id

      t.timestamps
    end
  end
end
