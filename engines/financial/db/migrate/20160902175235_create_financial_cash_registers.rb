class CreateFinancialCashRegisters < ActiveRecord::Migration
  def change
    create_table :financial_cash_registers do |t|

      t.integer :contract_id, index: true
      t.integer :cash_type, default: 0
      t.decimal :value,precision: 15, scale: 2
      t.text   :description
      t.text   :observation
      t.string :responsible
      t.string :archive
      t.string :note_number
      t.date   :due

      t.timestamps null: false
    end
  end
end
