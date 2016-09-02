class CreateCorePrivileges < ActiveRecord::Migration
  def change
    create_table :core_privileges do |t|
      t.string  :name
      t.string  :code
      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
