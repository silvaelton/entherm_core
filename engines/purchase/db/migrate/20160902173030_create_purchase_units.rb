class CreatePurchaseUnits < ActiveRecord::Migration
  def change
    create_table :purchase_units do |t|

      t.string  :name 
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
