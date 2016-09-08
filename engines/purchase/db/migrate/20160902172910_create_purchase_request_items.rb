class CreatePurchaseRequestItems < ActiveRecord::Migration
  def change
    create_table :purchase_request_items do |t|
      t.integer :request_id, index: true 
      t.integer :product_id, index: true 
      t.string  :unit
      t.integer :quantity,   default: 0
      t.string  :goal
      t.string  :observation
      t.integer :machine_id, default: 0
      t.string  :machine_version
      t.string  :machine_serial
      t.decimal :contract_value, precision: 15, scale: 2
      
      t.timestamps null: false
    end
  end
end
