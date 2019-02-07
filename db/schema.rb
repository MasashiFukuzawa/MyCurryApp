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

ActiveRecord::Schema.define(version: 2019_02_01_084935) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "body", null: false
    t.text "image_data"
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_comments_on_shop_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_likes_on_shop_id"
    t.index ["user_id", "shop_id"], name: "index_likes_on_user_id_and_shop_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.text "image_data"
    t.string "address", null: false
    t.string "area", null: false
    t.string "station", null: false
    t.string "url"
    t.string "twitter_url"
    t.string "facebook_url"
    t.string "tabelog_url"
    t.string "google_map_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "business_hour"
    t.string "holiday"
    t.text "access"
    t.integer "comments_count", default: 0
    t.integer "likes_count", default: 0
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "provider"
    t.string "uid"
    t.string "twitter_image"
    t.string "location"
    t.string "description"
    t.text "image_data"
    t.integer "comments_count", default: 0
    t.integer "likes_count", default: 0
    t.boolean "admin_flg", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "shops"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "shops"
  add_foreign_key "likes", "users"
end
