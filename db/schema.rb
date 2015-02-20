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

ActiveRecord::Schema.define(version: 20150220223046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_entries", force: :cascade do |t|
    t.datetime "completed_at"
    t.integer  "repository_id"
    t.string   "entry_type",    limit: 255
    t.text     "data"
    t.boolean  "published",                 default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "log_entries", ["entry_type"], name: "index_log_entries_on_entry_type", using: :btree
  add_index "log_entries", ["published"], name: "index_log_entries_on_published", using: :btree
  add_index "log_entries", ["repository_id"], name: "index_log_entries_on_repository_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "token",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "report_date"
    t.integer  "repository_id"
  end

  add_index "reports", ["client_id"], name: "index_reports_on_client_id", using: :btree
  add_index "reports", ["report_date"], name: "index_reports_on_report_date", using: :btree
  add_index "reports", ["repository_id"], name: "index_reports_on_repository_id", using: :btree

  create_table "repositories", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_entry_at"
  end

  add_index "repositories", ["client_id"], name: "index_repositories_on_client_id", using: :btree

end
