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

ActiveRecord::Schema.define(version: 20160424130615) do

  create_table "chefs", force: :cascade do |t|
    t.string   "name"
    t.integer  "age_string"
    t.string   "location"
    t.text     "styles"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
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
    t.integer  "age"
    t.string   "email"
    t.boolean  "active",            default: true
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "type"
    t.text     "description"
    t.integer  "menu_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "course_type"
  end

  add_index "courses", ["menu_id"], name: "index_courses_on_menu_id"

  create_table "events", force: :cascade do |t|
    t.string   "chef"
    t.string   "menu"
    t.string   "date"
    t.string   "location"
    t.string   "price"
    t.string   "persons"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "status",     default: "active"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.float    "price_string"
    t.integer  "chef_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "photo1"
    t.string   "photo2"
    t.string   "photo3"
    t.string   "photo4"
    t.string   "photo5"
    t.string   "currency"
    t.text     "description"
    t.boolean  "cuisine_italian"
    t.boolean  "cuisine_peruvian"
    t.boolean  "cuisine_mediterranean"
    t.boolean  "cuisine_spanish"
    t.boolean  "cuisine_american"
    t.boolean  "cuisine_japanese"
    t.boolean  "cuisine_fusion"
    t.boolean  "cuisine_thai"
    t.boolean  "cuisine_vietnamese"
    t.boolean  "cuisine_latinamerican"
    t.boolean  "cuisine_indian"
    t.boolean  "cuisine_persian"
    t.boolean  "cuisine_bbq"
    t.boolean  "cuisine_argentinian"
    t.boolean  "cuisine_anticuchos"
    t.boolean  "cuisine_patisserie"
    t.boolean  "cuisine_exotic"
    t.boolean  "cuisine_german"
    t.boolean  "cuisine_brazilian"
    t.boolean  "option_alcohol"
    t.boolean  "option_change"
    t.boolean  "hashtags_boolean"
    t.boolean  "partysize_boolean"
    t.integer  "price"
    t.string   "hashtags"
    t.string   "partysize"
    t.string   "eventtype"
  end

  add_index "menus", ["chef_id"], name: "index_menus_on_chef_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "no_of_guests"
    t.string   "menu_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "postalcode"
    t.string   "country"
    t.text     "remarks_sibaritas"
    t.text     "remarks_chef"
    t.float    "net_price"
    t.float    "vat_amount"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "currency"
    t.date     "cook_date"
    t.time     "cook_time"
    t.string   "cook_location"
    t.string   "status",            default: "PENDING"
    t.string   "chefid"
    t.string   "chef_id"
    t.string   "order_type"
    t.string   "event_id"
    t.string   "payment_status"
    t.string   "email_status",      default: "NOT_SENT"
  end

  create_table "searches", force: :cascade do |t|
    t.date     "cook_date"
    t.time     "cook_time"
    t.string   "cook_location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "max_price"
    t.string   "cuisine_type"
    t.string   "event_type"
  end

  create_table "subscribers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "type"
    t.string   "clienttype"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "company"
    t.string   "addressline1"
    t.string   "addressline2"
    t.string   "postalcode"
    t.string   "city"
    t.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
