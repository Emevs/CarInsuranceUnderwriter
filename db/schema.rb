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

ActiveRecord::Schema.define(version: 20131206164548) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "house_name_or_number", null: false
    t.string   "street_name",          null: false
    t.string   "county",               null: false
    t.string   "city",                 null: false
    t.string   "postcode",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "driver_histories", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_incidents", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "driver_histories", ["user_id"], name: "index_driver_histories_on_user_id"

  create_table "incidents", force: true do |t|
    t.integer  "driver_history_id"
    t.date     "date_of_incident"
    t.integer  "claim_value"
    t.string   "incident_type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incidents", ["driver_history_id"], name: "index_incidents_on_driver_history_id"

  create_table "personal_details", force: true do |t|
    t.string   "title"
    t.string   "forenames"
    t.string   "surname"
    t.string   "email"
    t.date     "date_of_birth"
    t.string   "telephone_number"
    t.string   "license_type"
    t.string   "license_period"
    t.string   "occupation"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personal_details", ["user_id"], name: "index_personal_details_on_user_id"

  create_table "policy_features", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "policy_excess",     null: false
    t.string   "breakdown_cover",   null: false
    t.string   "windscreen_repair", null: false
    t.integer  "windscreen_excess"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "policy_features", ["vehicle_id"], name: "index_policy_features_on_vehicle_id"

  create_table "quotes", force: true do |t|
    t.integer  "vehicle_id"
    t.string   "quote_reference"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quotes", ["vehicle_id"], name: "index_quotes_on_vehicle_id"

  create_table "users", force: true do |t|
    t.string   "uuid"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.integer  "user_id"
    t.string   "vehicle_registration", null: false
    t.integer  "annual_mileage",       null: false
    t.integer  "estimated_value",      null: false
    t.string   "parking_location",     null: false
    t.date     "policy_start_date",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
