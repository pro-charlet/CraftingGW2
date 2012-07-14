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

  create_table "items", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "url"
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

  create_table "members", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "members", ["name"], :name => "index_members_on_name", :unique => true

  create_table "priorities", :force => true do |t|
    t.string   "name"
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

  create_table "wishes", :force => true do |t|
    t.integer  "member_id",                           :null => false
    t.integer  "item_id",                             :null => false
    t.string   "statut",     :default => "Recherche", :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
