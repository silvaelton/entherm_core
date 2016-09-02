class CreatePurchaseProducts < ActiveRecord::Migration
  def change
    create_table :purchase_products do |t|
      
      t.string :name

      t.timestamps null: false
    end
  end
end
