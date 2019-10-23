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

ActiveRecord::Schema.define(version: 2019_10_15_044211) do

  create_table "addresses", force: :cascade do |t|
    t.integer "end_user_id"
    t.text "delivery_address"
    t.text "delivery_name"
    t.string "delivery_post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "family_name_kanji"
    t.string "given_name_kanji"
    t.string "family_name_kana"
    t.string "given_name_kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "product_id"
    t.integer "arrival_sum"
    t.datetime "arrived_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "product_id"
    t.integer "cart_sum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "product_id"
    t.integer "disc_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "family_name_kanji"
    t.string "given_name_kanji"
    t.string "family_name_kana"
    t.string "given_name_kana"
    t.text "address"
    t.string "post_code"
    t.string "phone_number"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price"
    t.integer "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "delivery_cost"
    t.integer "total_price"
    t.integer "order_status"
    t.string "order_post_code"
    t.text "order_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id"
    t.integer "label_id"
    t.integer "artist_id"
    t.integer "photo_id"
    t.integer "product_price"
    t.integer "sales_status"
    t.string "product_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.integer "song_no"
    t.string "song_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
