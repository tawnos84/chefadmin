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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150305180804) do

  create_table "chefs", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "location"
    t.text     "styles"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "biography"
    t.text     "culinarytraining"
    t.string   "picture"
    t.string   "video"
    t.boolean  "family_dinner"
    t.boolean  "informal_reunion"
    t.integer  "number_of_helpers"
    t.boolean  "last_minute"
    t.boolean  "teaching"
    t.integer  "min_size"
    t.integer  "max_size"
    t.string   "facebook"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "type"
    t.text     "description"
    t.integer  "menu_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "courses", ["menu_id"], name: "index_courses_on_menu_id"

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.integer  "chef_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menus", ["chef_id"], name: "index_menus_on_chef_id"

end
