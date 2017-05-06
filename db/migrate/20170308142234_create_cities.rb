class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.integer :postal_code, null: false
      t.string :city, null: false
    end
  end
end
