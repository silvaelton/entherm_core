class CreatePurchaseOrderCategories < ActiveRecord::Migration
  def change
    create_table :purchase_order_categories do |t|
      t.string :name 
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
