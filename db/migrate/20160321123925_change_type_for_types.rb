class ChangeTypeForTypes < ActiveRecord::Migration[5.0]
  def change
    rename_column :qbuilders, :type, :category
    rename_column :questions, :type, :category
  end
end
