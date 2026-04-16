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

ActiveRecord::Schema[8.1].define(version: 2026_04_16_093113) do
  create_table "authors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.string "isbn"
    t.boolean "out_of_print"
    t.decimal "price"
    t.integer "supplier_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "views"
    t.integer "year_published"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["supplier_id"], name: "index_books_on_supplier_id"
  end

  create_table "books_orders", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "order_id", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.integer "lock_version"
    t.integer "orders_count"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "visits"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "customer_id", null: false
    t.datetime "date_submitted"
    t.decimal "shipping"
    t.integer "status"
    t.decimal "subtotal"
    t.decimal "tax"
    t.decimal "total"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.integer "customer_id", null: false
    t.integer "rating"
    t.integer "state"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "suppliers"
  add_foreign_key "orders", "customers"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "customers"
end
