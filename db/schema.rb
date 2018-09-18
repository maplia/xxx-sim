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

ActiveRecord::Schema.define(version: 2018_09_18_152455) do

  create_table "musics", force: :cascade do |t|
    t.string "text_id", null: false
    t.string "lookup_key", null: false
    t.integer "number", default: 0
    t.string "title", null: false
    t.string "subtitle"
    t.string "sort_key", null: false
    t.string "artist"
    t.decimal "min_bpm"
    t.decimal "max_bpm"
    t.decimal "level1"
    t.integer "notes1"
    t.decimal "level2"
    t.integer "notes2"
    t.decimal "level3"
    t.integer "notes3"
    t.decimal "level4"
    t.integer "notes4"
    t.decimal "level5"
    t.integer "notes5"
    t.date "added_at", null: false
    t.date "revised_at"
    t.string "event"
    t.boolean "limited", default: false
    t.boolean "hidden", default: false
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.boolean "activated", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lookup_key"], name: "index_musics_on_lookup_key", unique: true
    t.index ["text_id"], name: "index_musics_on_text_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
