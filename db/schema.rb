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

ActiveRecord::Schema.define(version: 20171026173919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_1", null: false
    t.string "street_2"
    t.bigint "city_id"
    t.bigint "state_id"
    t.bigint "user_id"
    t.string "post_code", null: false
    t.string "plus_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "number", null: false
    t.date "expires", null: false
    t.bigint "cv2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "credit_card_id"
    t.bigint "billing_id"
    t.bigint "shipping_id"
    t.datetime "checkout_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_card_id"], name: "index_orders_on_credit_card_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbrev", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbrev"], name: "index_states_on_abbrev", unique: true
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "billing_id"
    t.bigint "shipping_id"
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "orders", "addresses", column: "billing_id"
  add_foreign_key "orders", "addresses", column: "shipping_id"
  add_foreign_key "orders", "credit_cards"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "users", "addresses", column: "billing_id"
  add_foreign_key "users", "addresses", column: "shipping_id"
end
