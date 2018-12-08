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

ActiveRecord::Schema.define(version: 20181119142713) do

  create_table "bookmarks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_bookmarks_on_room_id", using: :btree
    t.index ["user_id"], name: "index_bookmarks_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "parent_id"
    t.integer  "user_id",                  null: false
    t.integer  "room_id",                  null: false
    t.string   "text_content", limit: 500, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["room_id"], name: "index_comments_on_room_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id",    null: false
    t.integer "comment_id", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "comment_id", null: false
    t.integer "room_id",    null: false
    t.integer "stars",      null: false
    t.index ["comment_id"], name: "index_ratings_on_comment_id", using: :btree
    t.index ["room_id"], name: "index_ratings_on_room_id", using: :btree
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id",                                       null: false
    t.string  "room_name",       limit: 100,                   null: false
    t.string  "room_info",       limit: 5000,                  null: false
    t.string  "province",        limit: 40,                    null: false
    t.string  "address",         limit: 100,                   null: false
    t.integer "cost_per_night",                                null: false
    t.integer "type_of_room",                  default: 1,     null: false
    t.integer "num_of_guests",   limit: 1,                     null: false
    t.integer "num_of_bedrooms", limit: 1,                     null: false
    t.integer "num_of_beds",     limit: 1,                     null: false
    t.integer "num_of_baths",    limit: 1,                     null: false
    t.string  "amentities",      limit: 500,                   null: false
    t.string  "contact_host",    limit: 500,                   null: false
    t.text    "pictures",        limit: 65535,                 null: false
    t.boolean "is_approved",                   default: false
    t.index ["user_id"], name: "index_rooms_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "is_admin",                           default: false
    t.string   "username",                                           null: false
    t.string   "fullname",               limit: 50
    t.boolean  "gender"
    t.string   "address"
    t.string   "user_pic",               limit: 200
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookmarks", "rooms"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "rooms"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "users"
  add_foreign_key "ratings", "comments"
  add_foreign_key "ratings", "rooms"
  add_foreign_key "rooms", "users"
end
