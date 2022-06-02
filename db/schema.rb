# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_02_193839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "iebc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "counting_stations", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.string "type"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "election_periods", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "electoral_positions", force: :cascade do |t|
    t.string "name"
    t.string "jurisdiction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_observers_on_email", unique: true
  end

  create_table "pictures", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "political_parties", force: :cascade do |t|
    t.string "name"
    t.string "iebc_id"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_political_parties_on_admin_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "observer_id", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observer_id"], name: "index_sessions_on_observer_id"
  end

  create_table "signins", force: :cascade do |t|
    t.bigint "observer_id", null: false
    t.string "session_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observer_id"], name: "index_signins_on_observer_id"
  end

  create_table "tallies", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "total_count"
    t.bigint "counting_station_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_tallies_on_candidate_id"
    t.index ["counting_station_id"], name: "index_tallies_on_counting_station_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "election_period_id", null: false
    t.bigint "picture_id", null: false
    t.string "serial_no"
    t.bigint "counting_station_id", null: false
    t.bigint "candidate_id", null: false
    t.string "ballot_type"
    t.boolean "valid_vote"
    t.bigint "electoral_position_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
    t.index ["counting_station_id"], name: "index_votes_on_counting_station_id"
    t.index ["election_period_id"], name: "index_votes_on_election_period_id"
    t.index ["electoral_position_id"], name: "index_votes_on_electoral_position_id"
    t.index ["picture_id"], name: "index_votes_on_picture_id"
  end

  add_foreign_key "political_parties", "admins"
  add_foreign_key "sessions", "observers"
  add_foreign_key "signins", "observers"
  add_foreign_key "tallies", "candidates"
  add_foreign_key "tallies", "counting_stations"
  add_foreign_key "votes", "candidates"
  add_foreign_key "votes", "counting_stations"
  add_foreign_key "votes", "election_periods"
  add_foreign_key "votes", "electoral_positions"
  add_foreign_key "votes", "pictures"
end
