class AddPollRateToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :poll_rate, :integer
  end
end
