class CreatePurchaseSuppliers < ActiveRecord::Migration
  def change
    create_table :purchase_suppliers do |t|

      t.string :name 
      t.string :address
      t.string :complement
      t.string :cep 
      t.string :city
      t.integer :state_id
      t.string  :cnpj

      t.string :contact_name      
      t.string :contact_email      
      t.string :contact_telephone      
      t.string :contact_telephone_optional      
      t.string :contact_celphone     

      t.text   :observation

      t.integer :category_id, index: true
       
      t.timestamps null: false
    end
  end
end
