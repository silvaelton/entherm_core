class CreatePurchaseRequestComments < ActiveRecord::Migration
  def change
    create_table :purchase_request_comments do |t|
      t.integer :request_id, index: true 
      t.integer :requester_id, index: true
      t.integer :user_id, index: true 
      t.integer :comment_type, default: 0
      t.text    :message
      t.timestamps null: false
    end
  end
end
