# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160428053231) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "case_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "cases", force: :cascade do |t|
    t.string   "name"
    t.integer  "medical_record_num"
    t.integer  "age"
    t.string   "gender"
    t.string   "diagnosis"
    t.string   "disease_characteristic"
    t.string   "treatment_history"
    t.string   "past_medical_history"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "clinicians", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "specialty"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "clinicians", ["email"], name: "index_clinicians_on_email", unique: true
  add_index "clinicians", ["reset_password_token"], name: "index_clinicians_on_reset_password_token", unique: true

  create_table "notes", force: :cascade do |t|
    t.integer  "clinician_id"
    t.string   "subject"
    t.datetime "posting_date"
    t.datetime "last_edit_date"
    t.integer  "case_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "note_text"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "clinician_id"
    t.integer "case_id"
  end

  add_index "patients", ["case_id"], name: "index_patients_on_case_id"
  add_index "patients", ["clinician_id"], name: "index_patients_on_clinician_id"

end
