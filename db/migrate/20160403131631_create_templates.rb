class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.string :category
      t.integer :score

      t.timestamps
    end
  end
end
