# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150902183625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "post_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "friendship_requests", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "friendship_requests", ["receiver_id"], name: "index_friendship_requests_on_receiver_id", using: :btree
  add_index "friendship_requests", ["sender_id"], name: "index_friendship_requests_on_sender_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "friendship_starter_id"
    t.integer  "friendship_accepter_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "friendships", ["friendship_accepter_id"], name: "index_friendships_on_friendship_accepter_id", using: :btree
  add_index "friendships", ["friendship_starter_id"], name: "index_friendships_on_friendship_starter_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "liker_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["liker_id"], name: "index_likes_on_liker_id", using: :btree
  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree

  create_table "post_contents", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "post_contents", ["content_type", "content_id"], name: "index_post_contents_on_content_type_and_content_id", using: :btree
  add_index "post_contents", ["post_id"], name: "index_post_contents_on_post_id", using: :btree

  create_table "post_texts", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "text"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "last_name"
    t.string   "first_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "friendship_requests", "users", column: "receiver_id"
  add_foreign_key "friendship_requests", "users", column: "sender_id"
  add_foreign_key "friendships", "users", column: "friendship_accepter_id"
  add_foreign_key "friendships", "users", column: "friendship_starter_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users", column: "liker_id"
  add_foreign_key "post_contents", "posts"
  add_foreign_key "posts", "users", column: "author_id"
end
