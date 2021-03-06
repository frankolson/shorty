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

ActiveRecord::Schema.define(version: 2019_03_20_001732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_links", force: :cascade do |t|
    t.string "long_url"
    t.string "short_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_short_links_on_company_id"
    t.index ["user_id"], name: "index_short_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  create_table "visits", force: :cascade do |t|
    t.string "referrer"
    t.string "user_agent"
    t.bigint "short_link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_link_id"], name: "index_visits_on_short_link_id"
  end

  add_foreign_key "short_links", "companies"
  add_foreign_key "short_links", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "visits", "short_links"
end
