class CreateCoreUsers < ActiveRecord::Migration
  def change
    create_table :core_users do |t|

      t.string :name 
      t.string :email
      t.string :telephone
      t.string :avatar


      t.string :password

      t.boolean :status, default: true
      t.boolean :administrator, default: false

      t.text :privileges_id, array: true, default: []
      
      t.timestamps null: false
    end
  end
end
