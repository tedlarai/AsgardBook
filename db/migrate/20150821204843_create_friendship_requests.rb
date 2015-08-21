class CreateFriendshipRequests < ActiveRecord::Migration
  def change
    create_table :friendship_requests do |t|
      t.references :sender, index: true
      t.references :receiver, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendship_requests, :users, column: :sender_id
    add_foreign_key :friendship_requests, :users, column: :receiver_id
  end
end
