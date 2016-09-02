class CreateFinancialBills < ActiveRecord::Migration
  def change
    create_table :financial_bills do |t|
      
      t.integer :category_id,  index: true 
      t.integer :contract_id,  index: true
      t.text    :purchases_id, array: true, default: []
      t.string  :name 
      t.text    :description
      t.string  :fiscal_number
      t.integer :supplier_id, index: true 
      t.integer :bill_type, default: 0
      t.string  :archive

      t.timestamps null: false
    end
  end
end
