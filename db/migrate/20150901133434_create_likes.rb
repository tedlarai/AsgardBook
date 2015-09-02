class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :liker, index: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :users, column: :liker_id
  end
end
