# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_24_092330) do

  create_table "clubs", force: :cascade do |t|
    t.string "club_name"
    t.text "summary"
    t.integer "court_number"
    t.integer "place_number"
    t.boolean "training_monday"
    t.boolean "training_tuesday"
    t.boolean "training_wednesday"
    t.boolean "training_thusday"
    t.boolean "training_friday"
    t.boolean "training_saturday"
    t.boolean "training_sunday"
    t.boolean "player_ranking_n"
    t.boolean "player_ranking_r"
    t.boolean "player_ranking_d"
    t.boolean "player_ranking_pnc"
    t.boolean "is_coach"
    t.boolean "active"
    t.boolean "ffbad_affiliated"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "club_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["club_id"], name: "index_photos_on_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fullname"
    t.string "string"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "licence_number"
    t.text "club"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clubs", "users"
  add_foreign_key "photos", "clubs"
end
