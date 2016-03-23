class AddCategoryRate < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :category_rate, :integer
  end
end
