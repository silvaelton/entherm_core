class CreateFinancialBillCategories < ActiveRecord::Migration
  def change
    create_table :financial_bill_categories do |t|
      t.string :name 
      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
