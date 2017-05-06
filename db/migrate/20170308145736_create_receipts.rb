class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.decimal :total, null:false
      t.timestamps
    end
  end
end
