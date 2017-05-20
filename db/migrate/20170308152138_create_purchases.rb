class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :amount, null:false
      t.decimal :price
      t.on_the_way :boolean, null: false
      t.integer :user_id, null:false
      t.integer :product_id, null:false
      t.string  :product_title, null: false
      t.integer :receipt_id, null:false
      t.timestamps
    end
  end
end
