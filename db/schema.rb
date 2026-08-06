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

ActiveRecord::Schema[8.1].define(version: 2026_08_06_132903) do
  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.float "duration"
    t.string "loser"
    t.integer "scoreTeamA"
    t.integer "scoreTeamB"
    t.integer "tournaments_id", null: false
    t.datetime "updated_at", null: false
    t.string "winner"
    t.index ["tournaments_id"], name: "index_games_on_tournaments_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "name"
    t.integer "number"
    t.string "position"
    t.string "surname"
    t.integer "team_id", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "team_games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_id", null: false
    t.integer "team_id", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_team_games_on_game_id"
    t.index ["team_id"], name: "index_team_games_on_team_id"
  end

  create_table "team_tournaments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "team_id", null: false
    t.integer "tournament_id", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_tournaments_on_team_id"
    t.index ["tournament_id"], name: "index_team_tournaments_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "end_time"
    t.string "location"
    t.string "name"
    t.datetime "start_time"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "tournaments", column: "tournaments_id"
  add_foreign_key "players", "teams"
  add_foreign_key "team_games", "games"
  add_foreign_key "team_games", "teams"
  add_foreign_key "team_tournaments", "teams"
  add_foreign_key "team_tournaments", "tournaments"
end
