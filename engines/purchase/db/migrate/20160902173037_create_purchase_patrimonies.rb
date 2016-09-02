class CreatePurchasePatrimonies < ActiveRecord::Migration
  def change
    create_table :purchase_patrimonies do |t|

      t.string  :title 
      t.string  :archive
      t.string  :location
      t.decimal :estimed_value,  precision: 15, scale: 2
      t.decimal :original_value, precision: 15, scale: 2
      t.integer :state, default: 0
      t.integer :contract_id, index: true 
      t.integer :unit_id, index: true
      t.integer :quantity, default: 0
      t.string  :code
      t.date    :buy_date
      t.decimal :depreciation_month

      t.timestamps null: false
    end
  end
end
