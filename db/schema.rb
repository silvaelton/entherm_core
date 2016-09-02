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

ActiveRecord::Schema.define(version: 20160902175235) do

  create_table "core_alerts", force: :cascade do |t|
    t.string   "message"
    t.integer  "alert_type", default: 0
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "core_companies", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "core_companies", ["state_id"], name: "index_core_companies_on_state_id"

  create_table "core_contracts", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "core_contracts", ["company_id"], name: "index_core_contracts_on_company_id"

  create_table "core_privileges", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "core_requesters", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "avatar"
    t.boolean  "status",       default: true
    t.text     "contracts_id", default: "--- []\n"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "core_states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "avatar"
    t.string   "password"
    t.boolean  "status",        default: true
    t.boolean  "administrator", default: false
    t.text     "privileges_id", default: "--- []\n"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "financial_bill_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "financial_bill_portions", force: :cascade do |t|
    t.integer  "bill_id"
    t.decimal  "value",      precision: 15, scale: 2
    t.integer  "number"
    t.date     "due"
    t.boolean  "paid",                                default: false
    t.date     "paid_date"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "financial_bill_portions", ["bill_id"], name: "index_financial_bill_portions_on_bill_id"

  create_table "financial_bills", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "contract_id"
    t.text     "purchases_id",  default: "--- []\n"
    t.string   "name"
    t.text     "description"
    t.string   "fiscal_number"
    t.integer  "supplier_id"
    t.integer  "bill_type",     default: 0
    t.string   "archive"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "financial_bills", ["category_id"], name: "index_financial_bills_on_category_id"
  add_index "financial_bills", ["contract_id"], name: "index_financial_bills_on_contract_id"
  add_index "financial_bills", ["supplier_id"], name: "index_financial_bills_on_supplier_id"

  create_table "financial_cash_registers", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "cash_type",                            default: 0
    t.decimal  "value",       precision: 15, scale: 2
    t.text     "description"
    t.text     "observation"
    t.string   "responsible"
    t.string   "archive"
    t.string   "note_number"
    t.date     "due"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "financial_cash_registers", ["contract_id"], name: "index_financial_cash_registers_on_contract_id"

  create_table "financial_vincibles", force: :cascade do |t|
    t.text     "description"
    t.text     "observation"
    t.string   "archive"
    t.date     "due"
    t.boolean  "paid",        default: false
    t.date     "paid_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "purchase_order_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "unit_id"
    t.integer  "quantity"
    t.decimal  "unit_value",     precision: 15, scale: 2
    t.decimal  "total_value",    precision: 15, scale: 2
    t.decimal  "contract_value", precision: 15, scale: 2
    t.string   "observation"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "purchase_order_items", ["order_id"], name: "index_purchase_order_items_on_order_id"
  add_index "purchase_order_items", ["product_id"], name: "index_purchase_order_items_on_product_id"
  add_index "purchase_order_items", ["unit_id"], name: "index_purchase_order_items_on_unit_id"

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "contract_id"
    t.text     "requests_id",      default: "--- []\n"
    t.integer  "category_id"
    t.integer  "order_type",       default: 0
    t.string   "description"
    t.text     "observation"
    t.string   "invoice_number"
    t.string   "invoice_file"
    t.integer  "status",           default: 0
    t.integer  "supplier_id"
    t.string   "delivery"
    t.string   "form_payment"
    t.string   "deadline_payment"
    t.integer  "buy_type"
    t.string   "seller"
    t.string   "requester"
    t.integer  "carrier_id"
    t.string   "freight"
    t.boolean  "inventory"
    t.string   "icms"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "purchase_orders", ["category_id"], name: "index_purchase_orders_on_category_id"
  add_index "purchase_orders", ["contract_id"], name: "index_purchase_orders_on_contract_id"
  add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id"

  create_table "purchase_patrimonies", force: :cascade do |t|
    t.string   "title"
    t.string   "archive"
    t.string   "location"
    t.decimal  "estimed_value",      precision: 15, scale: 2
    t.decimal  "original_value",     precision: 15, scale: 2
    t.integer  "state",                                       default: 0
    t.integer  "contract_id"
    t.integer  "unit_id"
    t.integer  "quantity",                                    default: 0
    t.string   "code"
    t.date     "buy_date"
    t.decimal  "depreciation_month"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "purchase_patrimonies", ["contract_id"], name: "index_purchase_patrimonies_on_contract_id"
  add_index "purchase_patrimonies", ["unit_id"], name: "index_purchase_patrimonies_on_unit_id"

  create_table "purchase_patrimony_moviments", force: :cascade do |t|
    t.integer  "contract_id"
    t.string   "motive"
    t.string   "responsible"
    t.integer  "moviment_type", default: 0
    t.text     "observation"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "purchase_patrimony_moviments", ["contract_id"], name: "index_purchase_patrimony_moviments_on_contract_id"

  create_table "purchase_products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_request_comments", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "requester_id"
    t.integer  "user_id"
    t.integer  "comment_type", default: 0
    t.text     "message"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "purchase_request_comments", ["request_id"], name: "index_purchase_request_comments_on_request_id"
  add_index "purchase_request_comments", ["requester_id"], name: "index_purchase_request_comments_on_requester_id"
  add_index "purchase_request_comments", ["user_id"], name: "index_purchase_request_comments_on_user_id"

  create_table "purchase_request_items", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "product_id"
    t.integer  "unit_id"
    t.integer  "quantity",                                 default: 0
    t.string   "goal"
    t.string   "observation"
    t.integer  "machine_id",                               default: 0
    t.string   "machine_version"
    t.string   "machine_serial"
    t.decimal  "contract_value",  precision: 15, scale: 2
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "purchase_request_items", ["product_id"], name: "index_purchase_request_items_on_product_id"
  add_index "purchase_request_items", ["request_id"], name: "index_purchase_request_items_on_request_id"
  add_index "purchase_request_items", ["unit_id"], name: "index_purchase_request_items_on_unit_id"

  create_table "purchase_requests", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "requester_id"
    t.text     "description"
    t.text     "observation"
    t.integer  "situation",    default: 0
    t.integer  "priority",     default: 0
    t.string   "archive"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "purchase_requests", ["contract_id"], name: "index_purchase_requests_on_contract_id"
  add_index "purchase_requests", ["requester_id"], name: "index_purchase_requests_on_requester_id"

  create_table "purchase_stocks", force: :cascade do |t|
    t.integer  "purchase_id"
    t.integer  "product_id"
    t.integer  "contract_id"
    t.integer  "quantity",    default: 0
    t.integer  "unit_id"
    t.integer  "unit_value"
    t.integer  "operation",   default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "purchase_stocks", ["contract_id"], name: "index_purchase_stocks_on_contract_id"
  add_index "purchase_stocks", ["product_id"], name: "index_purchase_stocks_on_product_id"
  add_index "purchase_stocks", ["purchase_id"], name: "index_purchase_stocks_on_purchase_id"

  create_table "purchase_supplier_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "purchase_suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "complement"
    t.string   "cep"
    t.string   "city"
    t.integer  "state_id"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_telephone"
    t.string   "contact_telephone_optional"
    t.string   "contact_celphone"
    t.text     "observation"
    t.integer  "category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "purchase_suppliers", ["category_id"], name: "index_purchase_suppliers_on_category_id"

  create_table "purchase_units", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
