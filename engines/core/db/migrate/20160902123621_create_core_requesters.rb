class CreateCoreRequesters < ActiveRecord::Migration
  def change
    create_table :core_requesters do |t|

      t.string  :name 
      t.string  :email 
      t.string  :password
      t.string  :avatar

      t.boolean :status, default: true
        
      t.text :contracts_id, array: true, default: []

      t.timestamps null: false
    end
  end
end
