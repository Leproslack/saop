class AddTypesOfQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :qbuilders, :type,   :string
    add_column :questions, :type,   :string
    add_column :polls, :pos_rate,   :integer
    add_column :polls, :pos_name,   :string
    add_column :polls, :stuff_rate, :integer
    add_column :polls, :stuff_name, :string
  end
end
