class AddTitleToPoll < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :title, :string
  end
end
