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

ActiveRecord::Schema.define(version: 20170317224711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.integer "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_comments_on_food_id"
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

end
