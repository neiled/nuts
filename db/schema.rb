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

ActiveRecord::Schema.define(version: 20150401220836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breakdowns", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breakdowns", ["project_id_id"], name: "index_breakdowns_on_project_id_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "talent_id"
  end

  add_index "photos", ["talent_id"], name: "index_photos_on_talent_id", using: :btree

  create_table "photos_picks", id: false, force: :cascade do |t|
    t.integer "pick_id",  null: false
    t.integer "photo_id", null: false
  end

  add_index "photos_picks", ["pick_id", "photo_id"], name: "index_photos_picks_on_pick_id_and_photo_id", using: :btree

  create_table "picks", force: :cascade do |t|
    t.integer  "talent_id"
    t.integer  "breakdown_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "workflow_state", default: "new"
  end

  add_index "picks", ["breakdown_id"], name: "index_picks_on_breakdown_id", using: :btree
  add_index "picks", ["talent_id"], name: "index_picks_on_talent_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talents", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.date     "date_of_birth"
    t.date     "permit_expires"
  end

  add_foreign_key "picks", "breakdowns"
  add_foreign_key "picks", "talents"
end
