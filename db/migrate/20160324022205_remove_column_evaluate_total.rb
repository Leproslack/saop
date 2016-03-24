class RemoveColumnEvaluateTotal < ActiveRecord::Migration[5.0]
  def change
    remove_column :forms, :evaluate_total
  end
end
