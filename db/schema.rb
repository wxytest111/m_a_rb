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

ActiveRecord::Schema.define(version: 20160120134533) do

  create_table "admins", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "passwd",     limit: 255
    t.integer  "kind",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "apply_shops", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sex",        limit: 4
    t.string   "tel",        limit: 255
    t.string   "email",      limit: 255
    t.string   "creid",      limit: 255
    t.string   "company",    limit: 255
    t.integer  "shop_id",    limit: 4
    t.integer  "state",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "apply_shops", ["shop_id"], name: "index_apply_shops_on_shop_id", using: :btree

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

  create_table "pay_records", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.integer  "product_id",  limit: 4
    t.integer  "shop_id",     limit: 4
    t.integer  "pay_state",   limit: 4
    t.integer  "pay_num",     limit: 4
    t.datetime "pay_time"
    t.integer  "total_count", limit: 4
    t.integer  "left_count",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "pay_records", ["customer_id"], name: "index_pay_records_on_customer_id", using: :btree
  add_index "pay_records", ["product_id"], name: "index_pay_records_on_product_id", using: :btree
  add_index "pay_records", ["shop_id"], name: "index_pay_records_on_shop_id", using: :btree

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

  create_table "shop_customers", force: :cascade do |t|
    t.integer  "state",       limit: 4
    t.integer  "shop_id",     limit: 4
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "shop_customers", ["customer_id"], name: "index_shop_customers_on_customer_id", using: :btree
  add_index "shop_customers", ["shop_id"], name: "index_shop_customers_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "uuid",          limit: 255
    t.string   "title",         limit: 255
    t.string   "name",          limit: 255
    t.integer  "sex",           limit: 4
    t.string   "tel",           limit: 255
    t.string   "email",         limit: 255
    t.string   "creid",         limit: 255
    t.string   "company",       limit: 255
    t.string   "login_name",    limit: 255
    t.string   "login_pass",    limit: 255
    t.integer  "subshop_count", limit: 4
    t.integer  "level",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "steps", ["product_id"], name: "index_steps_on_product_id", using: :btree

  create_table "subscribes", force: :cascade do |t|
    t.integer  "customer_id",   limit: 4
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "product_id",    limit: 4
    t.integer  "pay_record_id", limit: 4
    t.string   "name",          limit: 255
    t.integer  "sex",           limit: 4
    t.string   "tel",           limit: 255
    t.integer  "district_id",   limit: 4
    t.string   "address",       limit: 255
    t.integer  "waitress_id",   limit: 4
    t.integer  "state",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "subscribes", ["customer_id"], name: "index_subscribes_on_customer_id", using: :btree
  add_index "subscribes", ["district_id"], name: "index_subscribes_on_district_id", using: :btree
  add_index "subscribes", ["pay_record_id"], name: "index_subscribes_on_pay_record_id", using: :btree
  add_index "subscribes", ["product_id"], name: "index_subscribes_on_product_id", using: :btree
  add_index "subscribes", ["waitress_id"], name: "index_subscribes_on_waitress_id", using: :btree

  create_table "waitresses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "apply_shops", "shops"
  add_foreign_key "customers", "districts"
  add_foreign_key "districts", "cities"
  add_foreign_key "pay_records", "customers"
  add_foreign_key "pay_records", "products"
  add_foreign_key "pay_records", "shops"
  add_foreign_key "products", "admins"
  add_foreign_key "shop_customers", "customers"
  add_foreign_key "shop_customers", "shops"
  add_foreign_key "steps", "products"
  add_foreign_key "subscribes", "customers"
  add_foreign_key "subscribes", "districts"
  add_foreign_key "subscribes", "pay_records"
  add_foreign_key "subscribes", "products"
  add_foreign_key "subscribes", "waitresses"
end
