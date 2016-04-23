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

ActiveRecord::Schema.define(version: 20160418201322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "enviro_types", force: :cascade do |t|
    t.string  "name"
    t.string  "units"
    t.boolean "active", default: true
  end

  create_table "enviro_values", force: :cascade do |t|
    t.integer "food_id"
    t.integer "enviro_type_id"
    t.float   "value"
  end

  create_table "foods", force: :cascade do |t|
    t.string  "name"
    t.string  "food_description"
    t.string  "serving_description"
    t.boolean "active",              default: true
    t.text    "tags",                default: [],   array: true
  end

  create_table "nutri_attributes", force: :cascade do |t|
    t.string  "name"
    t.string  "units"
    t.boolean "active", default: true
  end

  create_table "nutri_values", force: :cascade do |t|
    t.integer "food_id"
    t.integer "nutri_attribute_id"
    t.float   "value",              default: 1.0
  end

end
