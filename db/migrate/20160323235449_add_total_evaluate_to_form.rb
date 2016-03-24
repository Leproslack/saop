class AddTotalEvaluateToForm < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :evaluate_total, :integer
  end
end
