# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_22_132942) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "eventgroups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "regstartdate"
    t.date "regenddate"
    t.date "startdate"
    t.date "enddate"
    t.boolean "isactive"
    t.string "venue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "eventtype"
    t.text "eventrules"
    t.integer "eventgroup_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eventgroup_id"], name: "index_events_on_eventgroup_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "description"
    t.datetime "matchstarttime"
    t.string "round"
    t.string "teamone"
    t.string "teamtwo"
    t.string "venue"
    t.string "result"
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_matches_on_event_id"
  end

  create_table "newsfiles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teammembers", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.string "email"
    t.string "gender"
    t.string "role"
    t.text "achievements"
    t.string "foodpreference"
    t.integer "contactno"
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_teammembers_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "poc"
    t.integer "pocmobile"
    t.string "pocemail"
    t.datetime "arrivaldate"
    t.string "arrivalloc"
    t.string "modeofarrival"
    t.text "arrivaldetails"
    t.datetime "departuredate"
    t.string "departureloc"
    t.string "modeofdeparture"
    t.text "departuredetails"
    t.text "instructionsfromadmin"
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.text "achievements"
    t.string "travelplanstatus"
    t.index ["event_id"], name: "index_teams_on_event_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.integer "contactno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "eventgroups"
  add_foreign_key "matches", "events"
  add_foreign_key "teammembers", "teams"
  add_foreign_key "teams", "events"
  add_foreign_key "teams", "users"
end
