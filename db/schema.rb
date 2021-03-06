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

ActiveRecord::Schema.define(version: 2021_09_01_013624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bakeries", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.boolean "delivery"
    t.integer "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beds", force: :cascade do |t|
    t.string "name"
    t.boolean "occupied"
    t.integer "guest_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "days_old"
    t.boolean "gluten_free"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bakery_id"
    t.index ["bakery_id"], name: "index_goods_on_bakery_id"
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "bed_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "rent"
    t.boolean "visiting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bed_id"], name: "index_guests_on_bed_id"
  end

  add_foreign_key "goods", "bakeries"
  add_foreign_key "guests", "beds"
end
