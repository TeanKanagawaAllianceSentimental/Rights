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

ActiveRecord::Schema.define(version: 2018_09_30_051028) do

  create_table "addresses", force: :cascade do |t|
    t.integer "member_id"
    t.string "corporate_name", null: false
    t.string "corporate_phonetic"
    t.string "department"
    t.string "contact_person_name"
    t.string "contact_person_phonetic"
    t.string "postal_code"
    t.integer "prefecture_id"
    t.string "address1"
    t.string "address2"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "leave_at"
    t.index ["member_id"], name: "index_addresses_on_member_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "administrator_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phonetic"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.string "session_id"
    t.integer "item_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.integer "unit_price"
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
    t.integer "sale_id"
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

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string "member_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "leave_at"
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
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "billing_address1"
    t.string "billing_address2"
    t.string "contact_person"
    t.string "department"
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_price"
    t.integer "item_id"
  end

  create_table "sale_shippings", force: :cascade do |t|
    t.string "shipping_postal_code"
    t.string "user_telephone"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shipping_address1"
    t.string "shipping_address2"
    t.string "organisation_name"
    t.string "department"
    t.string "contact_person"
    t.integer "sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "total_price"
    t.integer "member_id"
    t.string "delivered"
    t.datetime "delivered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Application"
    t.integer "credit_card_id"
    t.integer "sale_invoice_id"
  end

end
