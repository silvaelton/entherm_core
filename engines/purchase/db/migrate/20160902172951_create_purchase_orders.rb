class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      
      t.integer :contract_id, index: true  #
      t.text    :requests_id, array: true, default: []
      t.integer :category_id, index: true
      t.integer :order_type, default: 0 #
      t.string  :description #
      t.text    :observation #
      t.string  :invoice_number #
      t.string  :invoice_file #
      t.integer :status, default: 0 #
      t.integer :supplier_id, index: true  #

      t.integer :delivery, default: 0 #
      t.integer :form_payment, default: 0 #
      t.string  :deadline_payment #
      t.integer :buy_type, default: 0 #
      t.string  :seller  #
      t.string  :requester  #
      t.integer :carrier_id #
      t.integer :freight, default: 0 # 
      t.boolean :inventory, defaul: false #
      t.string  :icms #

      t.timestamps null: false
    end
  end
end
