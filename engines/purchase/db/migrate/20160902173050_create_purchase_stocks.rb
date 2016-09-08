class CreatePurchaseStocks < ActiveRecord::Migration
  def change
    create_table :purchase_stocks do |t|

      t.integer :purchase_id, index: true
      t.integer :product_id, index: true 
      t.integer :contract_id, index: true
      t.integer :supplier_id, index: true
      t.integer :quantity, default: 0
      t.integer :unit_id 
      t.decimal :unit_value,  precision: 15, scale: 2
      t.integer :operation, default: 0 
      t.text    :observation 
      t.string  :location 
      t.string  :archive
      t.integer :state, default: 0
      t.timestamps null: false
    end
  end
end
