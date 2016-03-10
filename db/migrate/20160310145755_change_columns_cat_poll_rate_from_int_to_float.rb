class ChangeColumnsCatPollRateFromIntToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column(:polls, :cat1, :float)
    change_column(:polls, :cat2, :float)
    change_column(:polls, :cat3, :float)
    change_column(:polls, :poll_rate, :float)
  end
end
