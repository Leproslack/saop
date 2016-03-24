class AddEvaluateDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :forms, :evaluate_total, :integer, :default => 0
    change_column :formquestions, :evaluate_method, :integer, :default => 0
  end
end
