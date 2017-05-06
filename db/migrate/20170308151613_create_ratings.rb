class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.integer :grade, null: false
      t.text :comment
      t.timestamps
    end
  end
end
