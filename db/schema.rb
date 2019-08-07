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

ActiveRecord::Schema.define(version: 2019_08_01_015401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookstores", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editorials", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imprenta", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "adress"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imprenta_editorials", force: :cascade do |t|
    t.bigint "editorial_id"
    t.bigint "imprentum_id"
    t.integer "order"
    t.integer "guide_office"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["editorial_id"], name: "index_imprenta_editorials_on_editorial_id"
    t.index ["imprentum_id"], name: "index_imprenta_editorials_on_imprentum_id"
  end

  create_table "presses", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publisher_bookstores", force: :cascade do |t|
    t.bigint "publisher_id"
    t.bigint "bookstore_id"
    t.string "books"
    t.integer "guide_office"
    t.integer "quantity"
    t.integer "net_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookstore_id"], name: "index_publisher_bookstores_on_bookstore_id"
    t.index ["publisher_id"], name: "index_publisher_bookstores_on_publisher_id"
  end

  create_table "publisher_presses", force: :cascade do |t|
    t.bigint "publisher_id"
    t.bigint "press_id"
    t.integer "purchase_order"
    t.integer "delivery_order"
    t.integer "invoice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["press_id"], name: "index_publisher_presses_on_press_id"
    t.index ["publisher_id"], name: "index_publisher_presses_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "bookstore_id"
    t.bigint "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookstore_id"], name: "index_user_roles_on_bookstore_id"
    t.index ["publisher_id"], name: "index_user_roles_on_publisher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut"
    t.bigint "user_role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
  end

  add_foreign_key "imprenta_editorials", "editorials"
  add_foreign_key "imprenta_editorials", "imprenta"
  add_foreign_key "publisher_bookstores", "bookstores"
  add_foreign_key "publisher_bookstores", "publishers"
  add_foreign_key "publisher_presses", "presses"
  add_foreign_key "publisher_presses", "publishers"
  add_foreign_key "user_roles", "bookstores"
  add_foreign_key "user_roles", "publishers"
  add_foreign_key "users", "user_roles"
end
