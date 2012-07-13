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

ActiveRecord::Schema.define(:version => 20120712140638) do

  create_table "authenticates", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authenticates", ["provider"], :name => "index_authenticates_on_provider"
  add_index "authenticates", ["uid"], :name => "index_authenticates_on_uid"
  add_index "authenticates", ["user_id"], :name => "index_authenticates_on_user_id"

  create_table "coms", :force => true do |t|
    t.integer  "writer_id",  :null => false
    t.integer  "post_id",    :null => false
    t.string   "body"
    t.datetime "date"
    t.string   "like"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "craftings", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "craftings", ["name"], :name => "index_craftings_on_name", :unique => true

  create_table "craftmen", :force => true do |t|
    t.integer  "member_id",                  :null => false
    t.integer  "crafting_id",                :null => false
    t.integer  "level",       :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "game_id",    :null => false
    t.boolean  "deleted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flashes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "jackpot_id", :null => false
    t.boolean  "processed",  :null => false
    t.decimal  "bet",        :null => false
    t.datetime "date_round", :null => false
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.integer  "game_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "force_id",     :null => false
    t.string   "category"
    t.string   "sub_category"
    t.string   "type_c"
    t.string   "description"
    t.string   "logo"
    t.float    "tax"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "games", ["force_id"], :name => "index_games_on_force_id", :unique => true

  create_table "items", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "crafting_id"
    t.integer  "niveau",      :default => 0
    t.boolean  "gathering",   :default => false
    t.boolean  "looting",     :default => false
    t.boolean  "purchasing",  :default => false
    t.boolean  "salvaging",   :default => false
    t.integer  "priority_id", :default => 1
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "items", ["name"], :name => "index_items_on_name", :unique => true

  create_table "jackpots", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "force_id",   :null => false
    t.integer  "game_id",    :null => false
    t.date     "started",    :null => false
    t.date     "ended",      :null => false
    t.decimal  "amount",     :null => false
    t.decimal  "bet",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "main_streams", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "match_players", :force => true do |t|
    t.string   "user_id"
    t.integer  "match_id"
    t.integer  "placing"
    t.float    "profit"
    t.integer  "score"
    t.boolean  "confirm"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "tournament_id"
    t.string   "user_id"
    t.string   "game_id"
    t.float    "bet"
    t.integer  "nbPlayer"
    t.date     "playTime"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "members", ["name"], :name => "index_members_on_name", :unique => true

  create_table "news", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "force_id",   :null => false
    t.string   "body"
    t.string   "logo"
    t.datetime "date"
    t.boolean  "flash"
    t.boolean  "main"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "writer_id",  :null => false
    t.string   "title"
    t.string   "body"
    t.string   "style"
    t.datetime "date"
    t.string   "like"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "priorities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ranks", :force => true do |t|
    t.integer  "jackpot_id", :null => false
    t.integer  "user_id",    :null => false
    t.string   "user_name",  :null => false
    t.integer  "user_score", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipies", :force => true do |t|
    t.integer  "item_id",                      :null => false
    t.integer  "ingredient_id",                :null => false
    t.integer  "number",        :default => 1
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "synchros", :force => true do |t|
    t.string   "name",       :null => false
    t.date     "updated",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "synchros", ["name"], :name => "index_synchros_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "force_id"
    t.float    "caisse"
    t.integer  "virtuel"
    t.integer  "points"
    t.string   "vip_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

  create_table "wishes", :force => true do |t|
    t.integer  "member_id",                           :null => false
    t.integer  "item_id",                             :null => false
    t.string   "statut",     :default => "Recherche", :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
