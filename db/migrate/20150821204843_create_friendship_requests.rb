class CreateFriendshipRequests < ActiveRecord::Migration
  def change
    create_table :friendship_requests do |t|
      t.references :friendship_request_sender, index: true
      t.references :friendship_request_receiver, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendship_requests, :users, column: :friendship_request_sender_id
    add_foreign_key :friendship_requests, :users, column: :friendship_request_receiver_id
  end
end
