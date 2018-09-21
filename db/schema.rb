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

ActiveRecord::Schema.define(version: 2018_09_16_062148) do

  create_table "carts", force: :cascade do |t|
    t.string "session_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "credit_card_number", null: false
    t.string "credit_card_holder", null: false
    t.string "exp_month", null: false
    t.string "exp_year", null: false
    t.string "security_code", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.string "session_id"
    t.integer "item_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "credit_card_number"
    t.string "credit_card_holder"
    t.string "exp_month"
    t.string "exp_year"
    t.string "security_code"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disks", force: :cascade do |t|
    t.string "disk", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre", null: false
    t.integer "sequence", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "cd_title", null: false
    t.integer "genre_id", null: false
    t.integer "package", null: false
    t.string "artist", null: false
    t.text "jacket_image_id"
    t.string "label", null: false
    t.string "unit_price"
    t.string "caption"
    t.text "about"
    t.integer "stock_quantity"
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_items_on_genre_id"
  end

  create_table "musics", force: :cascade do |t|
    t.integer "disk_id", null: false
    t.string "music_title", null: false
    t.string "songwriter", null: false
    t.string "composer", null: false
    t.integer "sequence", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_invoices", force: :cascade do |t|
    t.string "bill_to"
    t.string "billing_postal_code"
    t.string "billing_address"
    t.integer "member_id"
    t.integer "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "sub_total", null: false
    t.integer "sale_id", null: false
    t.integer "items_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_shippings", force: :cascade do |t|
    t.string "shipping_postal_code", null: false
    t.string "shipping_address", null: false
    t.string "user_telephone", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "total_price", null: false
    t.integer "member_id"
    t.integer "delivered"
    t.datetime "delivered_at", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string "member_name"
    t.integer "main_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "corporate_name"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "musics", force: :cascade do |t|
    t.integer "disk_id", null: false
    t.string "music_title", null: false
    t.string "songwriter", null: false
    t.string "composer", null: false
    t.integer "sequence", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_invoices", force: :cascade do |t|
    t.string "bill_to"
    t.string "billing_postal_code"
    t.string "billing_address"
    t.integer "member_id"
    t.integer "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "sub_total"
    t.integer "sale_id"
    t.integer "items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_shippings", force: :cascade do |t|
    t.string "shipping_postal_code"
    t.string "shipping_address"
    t.string "user_telephone"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "total_price"
    t.integer "member_id"
    t.integer "delivered"
    t.datetime "delivered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
