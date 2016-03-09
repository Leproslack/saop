class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.integer :cat1
          t.integer :a11
          t.text    :ac11
          t.integer :a12
          t.text    :ac12
          t.integer :a13
          t.text    :ac13
      t.integer :cat2
          t.integer :a21
          t.text    :ac21
          t.integer :a22
          t.text    :ac22
      t.integer :cat3
          t.integer :a31
          t.text    :ac31

      t.timestamps
    end
  end
end
