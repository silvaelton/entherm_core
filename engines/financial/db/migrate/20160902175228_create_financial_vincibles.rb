class CreateFinancialVincibles < ActiveRecord::Migration
  def change
    create_table :financial_vincibles do |t|
      t.text :description
      t.text :observation
      t.string :archive
      t.date  :due
      
      t.boolean :paid, default: false
      t.date    :paid_date
      t.timestamps null: false
    end
  end
end
