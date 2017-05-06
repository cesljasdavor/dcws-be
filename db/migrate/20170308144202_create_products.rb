class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, null: false
      t.boolean :availability, default: true
      t.string :email_seller, null: false
      t.timestamps
    end
  end
end
