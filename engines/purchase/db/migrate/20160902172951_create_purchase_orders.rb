class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      
      t.integer :contract_id, index: true 
      t.text    :requests_id, array: true, default: []
      t.integer :category_id, index: true
      t.integer :order_type, default: 0
      t.string  :description
      t.text    :observation
      t.string  :invoice_number
      t.string  :invoice_file
      t.integer :status, default: 0
      t.integer :supplier_id, index: true 

      t.string  :delivery
      t.string  :form_payment
      t.string  :deadline_payment
      t.integer :buy_type 
      t.string  :seller 
      t.string  :requester 
      t.integer :carrier_id
      t.string  :freight
      t.boolean :inventory
      t.string  :icms

      t.timestamps null: false
    end
  end
end
