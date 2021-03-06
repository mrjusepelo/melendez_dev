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

ActiveRecord::Schema.define(version: 20140331205327) do

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
    t.string   "role"
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
    t.integer  "sale_id"
  end

  add_index "clients", ["city_id"], name: "index_clients_on_city_id", using: :btree
  add_index "clients", ["credit_id"], name: "index_clients_on_credit_id", using: :btree
  add_index "clients", ["sale_id"], name: "index_clients_on_sale_id", using: :btree

  create_table "consigments", force: true do |t|
    t.integer  "value"
    t.date     "date"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document"
    t.string   "name"
    t.text     "description"
  end

  add_index "consigments", ["order_id"], name: "index_consigments_on_order_id", using: :btree

  create_table "credit_products", force: true do |t|
    t.integer  "credit_id"
    t.string   "amount"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_value"
    t.integer  "inventory_id"
    t.string   "inventory_fields"
  end

  add_index "credit_products", ["credit_id"], name: "index_credit_products_on_credit_id", using: :btree
  add_index "credit_products", ["inventory_id"], name: "index_credit_products_on_inventory_id", using: :btree

  create_table "credits", force: true do |t|
    t.integer  "payment_mode_id"
    t.integer  "state_id"
    t.float    "total"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "sum_payments"
    t.date     "payday"
    t.integer  "number_payments"
    t.integer  "value_payments"
    t.integer  "admin_user_id"
    t.integer  "admin_creator_id"
    t.date     "nextpay"
    t.boolean  "published"
    t.float    "interescorriente"
    t.float    "interesmora"
    t.float    "subtotal"
  end

  add_index "credits", ["admin_creator_id"], name: "index_credits_on_admin_creator_id", using: :btree
  add_index "credits", ["admin_user_id"], name: "index_credits_on_admin_user_id", using: :btree
  add_index "credits", ["payment_mode_id"], name: "index_credits_on_payment_mode_id", using: :btree
  add_index "credits", ["state_id"], name: "index_credits_on_state_id", using: :btree

  create_table "financial_actives", force: true do |t|
    t.string   "name"
    t.float    "value"
    t.date     "date"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_passives", force: true do |t|
    t.string   "name"
    t.float    "value"
    t.date     "date"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "state_inventory_id"
    t.integer  "iva"
  end

  add_index "inventories", ["product_id"], name: "index_inventories_on_product_id", using: :btree
  add_index "inventories", ["state_inventory_id"], name: "index_inventories_on_state_inventory_id", using: :btree
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

  create_table "notification_credits", force: true do |t|
    t.date     "nextdate"
    t.integer  "credit_id"
    t.boolean  "revised"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notification_credits", ["credit_id"], name: "index_notification_credits_on_credit_id", using: :btree

  create_table "notifications", force: true do |t|
    t.boolean  "revised"
    t.integer  "order_id"
    t.date     "nextdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["order_id"], name: "index_notifications_on_order_id", using: :btree

  create_table "order_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
    t.integer  "value"
    t.integer  "unit_value"
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
    t.integer  "payment_mode_id"
    t.integer  "state_id"
    t.integer  "number_payments"
    t.integer  "value_payments"
    t.date     "payday"
    t.boolean  "published"
    t.date     "nextpay"
  end

  add_index "orders", ["payment_mode_id"], name: "index_orders_on_payment_mode_id", using: :btree
  add_index "orders", ["state_id"], name: "index_orders_on_state_id", using: :btree
  add_index "orders", ["supplier_id"], name: "index_orders_on_supplier_id", using: :btree

  create_table "pay_consigments", force: true do |t|
    t.date     "date"
    t.string   "num_register"
    t.string   "name"
    t.integer  "value"
    t.string   "num_account"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
  end

  add_index "pay_consigments", ["sale_id"], name: "index_pay_consigments_on_sale_id", using: :btree

  create_table "pay_efectives", force: true do |t|
    t.date     "date"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
  end

  add_index "pay_efectives", ["sale_id"], name: "index_pay_efectives_on_sale_id", using: :btree

  create_table "pay_sales", force: true do |t|
    t.integer  "value"
    t.date     "date"
    t.integer  "pay_efective_id"
    t.integer  "pay_consigment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
  end

  add_index "pay_sales", ["pay_consigment_id"], name: "index_pay_sales_on_pay_consigment_id", using: :btree
  add_index "pay_sales", ["pay_efective_id"], name: "index_pay_sales_on_pay_efective_id", using: :btree
  add_index "pay_sales", ["sale_id"], name: "index_pay_sales_on_sale_id", using: :btree

  create_table "payment_modes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments_credits", force: true do |t|
    t.date     "date"
    t.integer  "value",                   default: 0
    t.integer  "credit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "document"
    t.string   "name"
    t.integer  "interes"
    t.integer  "modo_pago"
    t.string   "cuenta"
    t.string   "tipo_cuenta"
    t.string   "referencia_consignacion"
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
    t.integer  "amount"
    t.text     "description"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree

  create_table "sale_products", force: true do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.integer  "value"
    t.integer  "amount"
    t.integer  "unit_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inventory_id"
    t.string   "inventory_fields"
  end

  add_index "sale_products", ["inventory_id"], name: "index_sale_products_on_inventory_id", using: :btree
  add_index "sale_products", ["sale_id"], name: "index_sale_products_on_sale_id", using: :btree

  create_table "sales", force: true do |t|
    t.integer  "credit_id"
    t.integer  "admin_user_id"
    t.date     "date"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_creator_id"
  end

  add_index "sales", ["admin_user_id"], name: "index_sales_on_admin_user_id", using: :btree
  add_index "sales", ["credit_id"], name: "index_sales_on_credit_id", using: :btree

  create_table "state_inventories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
