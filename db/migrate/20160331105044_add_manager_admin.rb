class AddManagerAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :manager, :boolean
    add_column :users, :admin, :boolean
  end
end
