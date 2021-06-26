# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_26_121741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "door_no"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.string "country"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string "menu_name"
    t.time "available_time_begin"
    t.time "available_time_end"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "menu_category_id", null: false
    t.string "item_name"
    t.string "description"
    t.decimal "price"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_category_id"], name: "index_menu_items_on_menu_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "role", default: "customer"
    t.string "password_digest"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "menu_items", "menu_categories"
end
