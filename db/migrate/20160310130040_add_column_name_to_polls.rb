class AddColumnNameToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :name, :string
  end
end
