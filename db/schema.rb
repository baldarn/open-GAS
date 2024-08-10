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

ActiveRecord::Schema[7.1].define(version: 2024_08_10_162416) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clubs", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", null: false
    t.datetime "discarded_at"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_clubs_on_discarded_at"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "event_groups", force: :cascade do |t|
    t.integer "event_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_groups_on_event_id"
    t.index ["group_id"], name: "index_event_groups_on_group_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "club_id"
    t.string "title", null: false
    t.integer "kind", null: false
    t.date "date_from", null: false
    t.date "date_to"
    t.time "time_from"
    t.time "time_to"
    t.boolean "all_day", default: false, null: false
    t.text "description"
    t.text "recurring"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_events_on_club_id"
    t.index ["place_id"], name: "index_events_on_place_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "club_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_groups_on_club_id"
  end

  create_table "member_groups", force: :cascade do |t|
    t.integer "member_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_member_groups_on_group_id"
    t.index ["member_id"], name: "index_member_groups_on_member_id"
  end

  create_table "member_tags", force: :cascade do |t|
    t.integer "member_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_tags_on_member_id"
    t.index ["tag_id"], name: "index_member_tags_on_tag_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "club_id"
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
    t.integer "medical_certificate_kind"
    t.date "medical_certificate_expires_at"
    t.string "membership_id"
    t.date "membership_expires_at"
    t.text "notes"
    t.boolean "privacy_disclaimer", default: false, null: false
    t.boolean "picture_disclaimer", default: false, null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_members_on_club_id"
    t.index ["discarded_at"], name: "index_members_on_discarded_at"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "member_id"
    t.integer "amount", null: false
    t.string "reason", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_payments_on_discarded_at"
    t.index ["member_id"], name: "index_payments_on_member_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presences", force: :cascade do |t|
    t.integer "member_id"
    t.integer "event_id"
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_presences_on_event_id"
    t.index ["member_id"], name: "index_presences_on_member_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "club_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_tags_on_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
