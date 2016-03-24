class AddEvaluationMethodToFormquestions < ActiveRecord::Migration[5.0]
  def change
    add_column :formquestions, :evaluate_method, :integer, :limit => 2
  end
end
