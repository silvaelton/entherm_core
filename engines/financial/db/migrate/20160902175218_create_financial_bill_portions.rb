class CreateFinancialBillPortions < ActiveRecord::Migration
  def change
    create_table :financial_bill_portions do |t|
      t.integer :bill_id, index: true 
      t.decimal :value, precision: 15, scale: 2
      t.integer :number 
      t.date    :due 
      t.boolean :paid, default: false 
      t.date    :paid_date
      
      t.timestamps null: false  
    end
  end
end
