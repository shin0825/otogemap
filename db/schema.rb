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

ActiveRecord::Schema.define(version: 2019_08_26_140256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amusement_arcade_shop_tags", force: :cascade do |t|
    t.bigint "amusement_arcade_id"
    t.bigint "shop_tag_id"
    t.index ["amusement_arcade_id"], name: "index_amusement_arcade_shop_tags_on_amusement_arcade_id"
    t.index ["shop_tag_id"], name: "index_amusement_arcade_shop_tags_on_shop_tag_id"
  end

  create_table "amusement_arcades", force: :cascade do |t|
    t.text "name"
    t.text "name_kana"
    t.bigint "prefecture_id"
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "homepage_url"
    t.string "twitter_url"
    t.index ["prefecture_id"], name: "index_amusement_arcades_on_prefecture_id"
  end

  create_table "iidx_machine_tags", force: :cascade do |t|
    t.bigint "iidx_id"
    t.bigint "machine_tag_id"
    t.index ["iidx_id"], name: "index_iidx_machine_tags_on_iidx_id"
    t.index ["machine_tag_id"], name: "index_iidx_machine_tags_on_machine_tag_id"
  end

  create_table "iidx_machines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_iidx_machines_on_name", unique: true
  end

  create_table "iidx_monitors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_iidx_monitors_on_name", unique: true
  end

  create_table "iidxes", force: :cascade do |t|
    t.string "name"
    t.text "serial_no"
    t.float "spring_weight"
    t.float "switch_weight"
    t.integer "cash_price"
    t.integer "paseli_price"
    t.integer "premium_free_time_from"
    t.integer "premium_free_time_to"
    t.boolean "paseli_availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "amusement_arcade_id"
    t.boolean "spring_is_found_value", default: false, null: false
    t.boolean "switch_is_found_value", default: false, null: false
    t.index ["amusement_arcade_id"], name: "index_iidxes_on_amusement_arcade_id"
  end

  create_table "machine_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_machine_tags_on_name", unique: true
  end

  create_table "prefectures", force: :cascade do |t|
    t.text "name"
    t.text "name_kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shop_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amusement_arcade_shop_tags", "amusement_arcades"
  add_foreign_key "amusement_arcade_shop_tags", "shop_tags"
  add_foreign_key "amusement_arcades", "prefectures"
  add_foreign_key "iidx_machine_tags", "iidxes"
  add_foreign_key "iidx_machine_tags", "machine_tags"
  add_foreign_key "iidxes", "amusement_arcades"
end
