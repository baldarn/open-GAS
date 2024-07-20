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

ActiveRecord::Schema[7.1].define(version: 2024_07_18_060539) do
  create_table "medical_certificates", force: :cascade do |t|
    t.integer "kind", null: false
    t.date "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "born_at", null: false
    t.string "born_in", null: false
    t.string "tax_code"
    t.string "citizenship", null: false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "municipality", null: false
    t.string "province", null: false
    t.string "telephone"
    t.string "email"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_memberships_on_member_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "member_id"
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_payments_on_member_id"
  end

end
