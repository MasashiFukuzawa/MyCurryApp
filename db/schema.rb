ActiveRecord::Schema.define(version: 2019_01_24_142311) do

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "twitter_image"
    t.string "location"
    t.text "description"
    t.string "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "image_data"
    t.string "address"
    t.string "area"
    t.string "station"
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
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
