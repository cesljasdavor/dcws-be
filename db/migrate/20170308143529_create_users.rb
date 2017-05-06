class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :email_admin
      t.string :password, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.date :date_of_birth
      t.string :telephone_number, null: false
      t.string :address, null:false
      t.integer :city_id, null:false
      t.integer :privilege, default: 0
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
