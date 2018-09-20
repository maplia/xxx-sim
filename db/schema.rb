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

ActiveRecord::Schema.define(version: 2018_09_20_142458) do

  create_table "monthlies", force: :cascade do |t|
    t.datetime "span_s", null: false
    t.integer "seq", null: false
    t.integer "music_id", null: false
    t.datetime "span_e", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id", "span_s"], name: "index_monthlies_on_music_id_and_span_s", unique: true
    t.index ["music_id"], name: "index_monthlies_on_music_id"
  end

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

  create_table "skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "music_id"
    t.integer "stat1"
    t.boolean "locked1"
    t.integer "gauge1"
    t.decimal "point1"
    t.decimal "rate1"
    t.boolean "rate1_f"
    t.integer "grade1"
    t.integer "combo1"
    t.integer "score1"
    t.integer "stat2"
    t.boolean "locked2"
    t.integer "gauge2"
    t.decimal "point2"
    t.decimal "rate2"
    t.boolean "rate2_f"
    t.integer "grade2"
    t.integer "combo2"
    t.integer "score2"
    t.integer "stat3"
    t.boolean "locked3"
    t.integer "gauge3"
    t.decimal "point3"
    t.decimal "rate3"
    t.boolean "rate3_f"
    t.integer "grade3"
    t.integer "combo3"
    t.integer "score3"
    t.integer "stat4"
    t.boolean "locked4"
    t.integer "gauge4"
    t.decimal "point4"
    t.decimal "rate4"
    t.boolean "rate4_f"
    t.integer "grade4"
    t.integer "combo4"
    t.integer "score4"
    t.integer "stat5"
    t.boolean "locked5"
    t.integer "gauge5"
    t.decimal "point5"
    t.decimal "rate5"
    t.boolean "rate5_f"
    t.integer "grade5"
    t.integer "combo5"
    t.integer "score5"
    t.string "comment"
    t.integer "best_diff"
    t.decimal "best_point"
    t.integer "l_best_diff"
    t.decimal "l_best_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_skills_on_music_id"
    t.index ["user_id", "music_id"], name: "index_skills_on_user_id_and_music_id", unique: true
    t.index ["user_id"], name: "index_skills_on_user_id"
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
