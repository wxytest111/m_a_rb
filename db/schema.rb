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

ActiveRecord::Schema.define(version: 20150622022521) do

  create_table "advertisements", force: :cascade do |t|
    t.string   "url",        limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "status",      limit: 4,   default: 0, null: false
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "address",     limit: 255
    t.integer  "product_id",  limit: 4
    t.integer  "service_id",  limit: 4
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "appointments", ["customer_id"], name: "index_appointments_on_customer_id", using: :btree
  add_index "appointments", ["product_id"], name: "index_appointments_on_product_id", using: :btree
  add_index "appointments", ["service_id"], name: "index_appointments_on_service_id", using: :btree

  create_table "check_codes", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "mobile",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "mobile",      limit: 255
    t.string   "address",     limit: 255
    t.text     "description", limit: 65535
    t.integer  "gender",      limit: 4,     default: 0, null: false
    t.string   "nick_name",   limit: 255
    t.string   "password",    limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "grabs", force: :cascade do |t|
    t.integer  "worker_id",      limit: 4
    t.integer  "appointment_id", limit: 4
    t.integer  "status",         limit: 4, default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "grabs", ["appointment_id"], name: "index_grabs_on_appointment_id", using: :btree
  add_index "grabs", ["worker_id"], name: "index_grabs_on_worker_id", using: :btree

  create_table "product_details", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "product_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "product_details", ["product_id"], name: "index_product_details_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "pic",            limit: 255
    t.string   "address",        limit: 255
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "duration",       limit: 255
    t.integer  "original_price", limit: 4
    t.integer  "current_price",  limit: 4
    t.string   "service_pic",    limit: 255
    t.string   "applicable",     limit: 255
    t.string   "effect",         limit: 255
  end

  create_table "services", force: :cascade do |t|
    t.float    "price",       limit: 24
    t.text     "description", limit: 65535
    t.string   "pic",         limit: 255
    t.string   "name",        limit: 255
    t.string   "address",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.string   "name",       limit: 255
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "steps", ["product_id"], name: "index_steps_on_product_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "token",       limit: 255
    t.integer  "customer_id", limit: 4
    t.integer  "worker_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "mobile",      limit: 255
    t.string   "avatar",      limit: 255
    t.float    "star",        limit: 24
    t.integer  "gender",      limit: 4,     default: 0, null: false
    t.text     "description", limit: 65535
    t.string   "skills",      limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "password",    limit: 255
    t.string   "address",     limit: 255
    t.integer  "status",      limit: 4,     default: 0, null: false
    t.string   "pic",         limit: 255
    t.integer  "success",     limit: 4
    t.integer  "cancel",      limit: 4
    t.integer  "miss",        limit: 4
  end

  add_foreign_key "appointments", "customers"
  add_foreign_key "appointments", "products"
  add_foreign_key "appointments", "services"
  add_foreign_key "grabs", "appointments"
  add_foreign_key "grabs", "workers"
  add_foreign_key "product_details", "products"
  add_foreign_key "steps", "products"
end
