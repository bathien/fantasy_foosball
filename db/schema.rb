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

ActiveRecord::Schema.define(version: 2019_05_11_122623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "winner_team_id"
    t.integer "team_1_score"
    t.integer "team_2_score"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_games_on_match_id"
    t.index ["winner_team_id"], name: "index_games_on_winner_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "team_1_id"
    t.bigint "team_2_id"
    t.bigint "winner_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_1_id"], name: "index_matches_on_team_1_id"
    t.index ["team_2_id"], name: "index_matches_on_team_2_id"
    t.index ["winner_team_id"], name: "index_matches_on_winner_team_id"
  end

  create_table "player_teams", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_teams_on_player_id"
    t.index ["team_id"], name: "index_player_teams_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "matches"
  add_foreign_key "games", "teams", column: "winner_team_id", on_delete: :cascade
  add_foreign_key "matches", "teams", column: "team_1_id", on_delete: :cascade
  add_foreign_key "matches", "teams", column: "team_2_id", on_delete: :cascade
  add_foreign_key "matches", "teams", column: "winner_team_id", on_delete: :cascade
  add_foreign_key "player_teams", "players"
  add_foreign_key "player_teams", "teams"
end
