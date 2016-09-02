class CreatePurchaseSupplierCategories < ActiveRecord::Migration
  def change
    create_table :purchase_supplier_categories do |t|
      t.string :name 
      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
