class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table   :questions do |t|
      t.string     :quest
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
  end
end
