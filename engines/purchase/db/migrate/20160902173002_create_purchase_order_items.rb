class CreatePurchaseOrderItems < ActiveRecord::Migration
  def change
    create_table :purchase_order_items do |t|
      t.integer :order_id,   index: true 
      t.integer :product_id, index: true
      t.integer :unit_id,    index: true
      t.integer :quantity

      t.decimal :unit_value,     precision: 15, scale: 2
      t.decimal :total_value,    precision: 15, scale: 2
      t.decimal :contract_value, precision: 15, scale: 2
      
      t.string  :observation

      t.timestamps null: false
    end
  end
end
