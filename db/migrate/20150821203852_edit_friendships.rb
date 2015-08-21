class EditFriendships < ActiveRecord::Migration
  def change
    drop_table :friendships

    create_table :friendships do |t|
      t.references :friendship_starter, index: true
      t.references :friendship_accepter, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :friendship_starter_id
    add_foreign_key :friendships, :users, column: :friendship_accepter_id
  end
end
