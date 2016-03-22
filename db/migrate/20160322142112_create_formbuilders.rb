class CreateFormbuilders < ActiveRecord::Migration[5.0]
  def change
    create_table :formbuilders do |t|
      t.string :category

      t.timestamps
    end
  end
end
