class CreateCoreStates < ActiveRecord::Migration
  def change
    create_table :core_states do |t|

      t.string :name 
      t.string :acronym 
      
      t.timestamps null: false
    end
  end
end
