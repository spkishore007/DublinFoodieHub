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

ActiveRecord::Schema.define(version: 20170410194906) do

  create_table "addons", force: :cascade do |t|
    t.string "addonName"
    t.string "addonType"
    t.integer "addonPrice"
    t.integer "hit"
    t.integer "store_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_detail_id"], name: "index_addons_on_store_detail_id"
  end

  create_table "clicks", force: :cascade do |t|
    t.integer "product_identity"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_clicks_on_member_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.integer "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["food_id"], name: "index_comments_on_food_id"
  end

  create_table "dsales", force: :cascade do |t|
    t.date "day"
    t.integer "totalSale"
    t.integer "profit"
    t.integer "nonVegSale"
    t.integer "vegSale"
    t.integer "offeredSale"
    t.integer "nonOfferedSale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "foodName"
    t.string "foodType"
    t.string "foodSize"
    t.integer "actualPrice"
    t.integer "offerPrice"
    t.integer "quantityAvailable"
    t.integer "hit"
    t.integer "store_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_detail_id"], name: "index_foods_on_store_detail_id"
  end

  create_table "medicals", force: :cascade do |t|
    t.string "userName"
    t.integer "age"
    t.string "medicalCondition"
    t.string "disease"
    t.string "allergens"
    t.integer "mobile"
    t.string "idProof"
    t.date "causedTime"
    t.string "foodHabit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
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
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.integer "login_Count"
    t.string "building"
    t.string "street"
    t.string "city"
    t.string "pincode"
    t.integer "mobile"
    t.date "date_0f_Birth"
    t.string "id_proof"
    t.boolean "admin", default: false
    t.boolean "owner", default: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "msales", force: :cascade do |t|
    t.string "month"
    t.integer "totalSale"
    t.integer "profit"
    t.integer "nonVegSale"
    t.integer "vegSale"
    t.integer "offeredSale"
    t.integer "nonOfferedSale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "unit_price"
    t.integer "quantity"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "tax", precision: 12, scale: 3
    t.decimal "shipping", precision: 12, scale: 3
    t.decimal "total", precision: 12, scale: 3
    t.integer "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_detail_id"
    t.string "description"
    t.string "foodType"
    t.string "foodSize"
    t.integer "offerPrice"
    t.integer "quantityAvailable"
    t.string "allergens"
    t.string "ingredients"
    t.integer "calorie"
    t.integer "hit"
    t.text "tapping"
    t.integer "count"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "building"
    t.string "street"
    t.string "city"
    t.integer "pincode"
    t.integer "mobile"
    t.date "dateOfBirth"
    t.string "email"
    t.string "idProof"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_profiles_on_member_id"
  end

  create_table "store_details", force: :cascade do |t|
    t.string "store_name"
    t.string "building"
    t.string "street"
    t.string "city"
    t.string "pincode"
    t.integer "store_mobile"
    t.string "store_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.index ["member_id"], name: "index_store_details_on_member_id"
  end

  create_table "wsales", force: :cascade do |t|
    t.string "week"
    t.integer "totalSale"
    t.integer "profit"
    t.integer "nonVegSale"
    t.integer "vegSale"
    t.integer "offeredSale"
    t.integer "nonOfferedSale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
