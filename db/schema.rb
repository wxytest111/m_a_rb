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

ActiveRecord::Schema.define(version: 20160120132745) do

  create_table "admins", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "passwd",     limit: 255
    t.integer  "kind",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "birds", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "birds", ["email"], name: "index_birds_on_email", unique: true, using: :btree
  add_index "birds", ["reset_password_token"], name: "index_birds_on_reset_password_token", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "uin",         limit: 255
    t.string   "passwd",      limit: 255
    t.string   "name",        limit: 255
    t.integer  "sex",         limit: 4
    t.string   "tel",         limit: 255
    t.string   "address",     limit: 255
    t.integer  "district_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "customers", ["district_id"], name: "index_customers_on_district_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "duration",    limit: 4
    t.text     "period",      limit: 65535
    t.text     "effect",      limit: 65535
    t.text     "applicable",  limit: 65535
    t.integer  "kind",        limit: 4
    t.integer  "howuse",      limit: 4
    t.integer  "total_count", limit: 4
    t.string   "pic_path",    limit: 255
    t.integer  "show_price",  limit: 4
    t.integer  "pay_price",   limit: 4
    t.integer  "state",       limit: 4
    t.integer  "admin_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "products", ["admin_id"], name: "index_products_on_admin_id", using: :btree

  add_foreign_key "customers", "districts"
  add_foreign_key "districts", "cities"
  add_foreign_key "products", "admins"
end
