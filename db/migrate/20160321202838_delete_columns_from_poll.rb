class DeleteColumnsFromPoll < ActiveRecord::Migration[5.0]
  def change
    remove_column :polls, :pos_name
    remove_column :polls, :pos_rate
    remove_column :polls, :stuff_rate
    remove_column :polls, :stuff_name
  end
end
