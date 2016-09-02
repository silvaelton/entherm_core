class CreateCoreAlerts < ActiveRecord::Migration
  def change
    create_table :core_alerts do |t|

      t.string  :message
      t.integer :alert_type, default:  0
      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
