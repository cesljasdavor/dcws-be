class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :super_category
    end
  end
end
