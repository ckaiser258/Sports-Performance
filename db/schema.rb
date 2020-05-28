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


ActiveRecord::Schema.define(version: 2020_05_28_170007) do

  create_table "athlete_sports", force: :cascade do |t|
    t.integer "athlete_id", null: false
    t.integer "sport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["athlete_id"], name: "index_athlete_sports_on_athlete_id"
    t.index ["sport_id"], name: "index_athlete_sports_on_sport_id"
  end

  create_table "athletes", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "email"
    t.integer "coach_id", null: false
    t.integer "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["coach_id"], name: "index_athletes_on_coach_id"
    t.index ["program_id"], name: "index_athletes_on_program_id"
  end

  create_table "coach_sports", force: :cascade do |t|
    t.integer "coach_id", null: false
    t.integer "sport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_coach_sports_on_coach_id"
    t.index ["sport_id"], name: "index_coach_sports_on_sport_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "price"
    t.integer "coach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_programs_on_coach_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "athlete_sports", "athletes"
  add_foreign_key "athlete_sports", "sports"
  add_foreign_key "athletes", "coaches"
  add_foreign_key "athletes", "programs"
  add_foreign_key "coach_sports", "coaches"
  add_foreign_key "coach_sports", "sports"
  add_foreign_key "programs", "coaches"
end
