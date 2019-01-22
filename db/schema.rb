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

ActiveRecord::Schema.define(version: 2019_01_21_075414) do

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "image"
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

end
