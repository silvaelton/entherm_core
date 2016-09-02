class CreatePurchaseStocks < ActiveRecord::Migration
  def change
    create_table :purchase_stocks do |t|

      t.integer :purchase_id, index: true
      t.integer :product_id, index: true 
      t.integer :contract_id, index: true
      t.integer :quantity, default: 0
      t.integer :unit_id 
      t.integer :unit_value
      t.integer :operation, default: 0 
      
      t.timestamps null: false
    end
  end
end
