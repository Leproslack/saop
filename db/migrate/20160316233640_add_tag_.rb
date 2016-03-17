class AddTag < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :tag, :text
  end
end
