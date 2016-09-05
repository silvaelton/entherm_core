class CreateCoreCompanies < ActiveRecord::Migration
  def change
    create_table :core_companies do |t|

      t.string :cnpj 
      t.string :name 
      t.string :address 
      t.string :city 
      t.string :cep 
      t.string :telephone
      
      t.integer :state_id, index: true 
      t.boolean :status, default: true 
      
      t.timestamps null: false
    end
  end
end
