class CreateNewcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :newcategories do |t|
      t.string :new_category_name
      t.integer :new_category_score, default: 0


      t.timestamps
    end
  end
end
