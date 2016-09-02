class CreatePurchaseRequests < ActiveRecord::Migration
  def change
    create_table :purchase_requests do |t|
      t.integer :contract_id, index: true 
      t.integer :requester_id, index: true
      t.text    :description
      t.text    :observation
      t.integer :situation, default: 0
      t.integer :priority,  default: 0
      t.string  :archive

      t.timestamps null: false
    end
  end
end
