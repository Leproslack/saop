class CreateQbuilders < ActiveRecord::Migration[5.0]
  def change
    create_table :qbuilders do |t|
      t.text :name

      t.timestamps
    end
  end
end
