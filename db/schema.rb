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

ActiveRecord::Schema[8.1].define(version: 2026_10_20_120000) do
  create_table "games", force: :cascade do |t|
    t.integer "tournament_id", null: false
    t.integer "score_team_a"
    t.integer "score_team_b"
    t.float "duration"
    t.string "winner"
    t.string "loser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_a_id", null: false
    t.integer "team_b_id", null: false
    t.index ["team_a_id"], name: "index_games_on_team_a_id"
    t.index ["team_b_id"], name: "index_games_on_team_b_id"
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "position"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "team_tournaments", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "tournament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_tournaments_on_team_id"
    t.index ["tournament_id"], name: "index_team_tournaments_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "teams", column: "team_a_id"
  add_foreign_key "games", "teams", column: "team_b_id"
  add_foreign_key "games", "tournaments"
  add_foreign_key "players", "teams"
  add_foreign_key "team_tournaments", "teams"
  add_foreign_key "team_tournaments", "tournaments"
end
