class CreatePurchasePatrimonyMoviments < ActiveRecord::Migration
  def change
    create_table :purchase_patrimony_moviments do |t|
      t.integer :contract_id, index: true 
      t.string  :motive
      t.string  :responsible
      t.integer :moviment_type, default: 0
      t.text    :observation
      t.timestamps null: false
    end
  end
end
