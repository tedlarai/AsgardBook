class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :requester, index: true
      t.references :accepter, index: true
      t.string :status

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :requester_id
    add_foreign_key :friendships, :users, column: :accepter_id
  end
end
