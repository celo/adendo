# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130328182831) do

  create_table "answers", :force => true do |t|
    t.integer  "room_player_id"
    t.integer  "room_match_id"
    t.integer  "room_column_id"
    t.string   "value"
    t.integer  "score"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "answers", ["room_column_id"], :name => "index_answers_on_room_column_id"
  add_index "answers", ["room_match_id"], :name => "index_answers_on_room_match_id"
  add_index "answers", ["room_player_id"], :name => "index_answers_on_room_player_id"

  create_table "columns", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_columns", :force => true do |t|
    t.string   "name"
    t.integer  "room_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "room_columns", ["room_id"], :name => "index_room_columns_on_room_id"

  create_table "room_matches", :force => true do |t|
    t.integer  "room_id"
    t.string   "letter"
    t.datetime "started_at"
    t.datetime "stopped_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "room_matches", ["room_id"], :name => "index_room_matches_on_room_id"

  create_table "room_players", :force => true do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "room_players", ["room_id"], :name => "index_room_players_on_room_id"
  add_index "room_players", ["user_id"], :name => "index_room_players_on_user_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.string   "letters"
    t.integer  "maxplayers"
    t.integer  "maxmatches"
    t.integer  "maxmatchtime"
    t.boolean  "private"
    t.integer  "created_by"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
