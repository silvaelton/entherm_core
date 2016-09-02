class CreateCoreContracts < ActiveRecord::Migration
  def change
    create_table :core_contracts do |t|

      t.integer :company_id, index: true 
      t.string  :name
      t.text    :description
      t.string  :code 
      t.boolean :status, default: true 

      t.timestamps null: false
    end
  end
end
