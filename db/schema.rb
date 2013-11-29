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

ActiveRecord::Schema.define(version: 20131129154831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "document"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "document"
    t.string   "address"
    t.string   "phone"
    t.string   "neihborhood"
    t.integer  "city_id"
    t.boolean  "buyer"
    t.boolean  "bondsman"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credit_id"
  end

  add_index "clients", ["city_id"], name: "index_clients_on_city_id", using: :btree
  add_index "clients", ["credit_id"], name: "index_clients_on_credit_id", using: :btree

  create_table "consigments", force: true do |t|
    t.integer  "value"
    t.date     "date"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consigments", ["order_id"], name: "index_consigments_on_order_id", using: :btree

  create_table "credit_products", force: true do |t|
    t.integer  "product_id"
    t.integer  "credit_id"
    t.string   "amount"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_value"
  end

  add_index "credit_products", ["credit_id"], name: "index_credit_products_on_credit_id", using: :btree
  add_index "credit_products", ["product_id"], name: "index_credit_products_on_product_id", using: :btree

  create_table "credits", force: true do |t|
    t.integer  "payment_mode_id"
    t.integer  "state_id"
    t.integer  "total"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "sum_payments"
    t.date     "payday"
    t.integer  "number_payments"
    t.integer  "value_payments"
    t.integer  "admin_id"
  end

  add_index "credits", ["admin_id"], name: "index_credits_on_admin_id", using: :btree
  add_index "credits", ["payment_mode_id"], name: "index_credits_on_payment_mode_id", using: :btree
  add_index "credits", ["state_id"], name: "index_credits_on_state_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "route"
    t.boolean  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "inventories", force: true do |t|
    t.integer  "product_id"
    t.integer  "supplier_id"
    t.string   "barcode"
    t.integer  "vale_buy"
    t.integer  "vale_sale"
    t.integer  "warranty"
    t.date     "date_in"
    t.date     "date_out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "serial"
  end

  add_index "inventories", ["product_id"], name: "index_inventories_on_product_id", using: :btree
  add_index "inventories", ["supplier_id"], name: "index_inventories_on_supplier_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "reason"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.date     "date_billed"
    t.date     "date_arrival"
    t.date     "date_limit_pay"
    t.date     "date_pay_real"
    t.string   "val_real"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.integer  "sum_payments"
  end

  add_index "orders", ["supplier_id"], name: "index_orders_on_supplier_id", using: :btree

  create_table "payment_modes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments_credits", force: true do |t|
    t.date     "date"
    t.integer  "value"
    t.integer  "credit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "document"
    t.string   "name"
  end

  add_index "payments_credits", ["credit_id"], name: "index_payments_credits_on_credit_id", using: :btree

  create_table "product_categories", force: true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id", using: :btree
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "frecuence_notification"
    t.boolean  "state"
  end

  add_index "suppliers", ["city_id"], name: "index_suppliers_on_city_id", using: :btree

  create_table "support_documents", force: true do |t|
    t.string   "name"
    t.string   "route"
    t.integer  "credit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "support_documents", ["credit_id"], name: "index_support_documents_on_credit_id", using: :btree

end
