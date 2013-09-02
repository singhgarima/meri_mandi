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

ActiveRecord::Schema.define(version: 20130902175600) do

  create_table "commodities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commodity_prices", force: true do |t|
    t.integer  "min_price"
    t.integer  "max_price"
    t.integer  "mode_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arrival_date"
    t.integer  "market_id"
    t.integer  "variety_id"
  end

  create_table "districts", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markets", force: true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_preferences", force: true do |t|
    t.integer  "user_id"
    t.integer  "market_id"
    t.integer  "variety_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.integer  "state_id"
    t.string   "city"
    t.integer  "market_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["mobile"], name: "index_users_on_mobile"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "varieties", force: true do |t|
    t.string   "name"
    t.integer  "commodity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
