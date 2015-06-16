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

ActiveRecord::Schema.define(version: 20150616010827) do

  create_table "advertisements", force: :cascade do |t|
    t.string   "url",        limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "pic",         limit: 255
    t.string   "address",     limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

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

end
