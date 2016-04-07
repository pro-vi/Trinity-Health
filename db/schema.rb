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

ActiveRecord::Schema.define(version: 20160407023824) do

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
    t.string "name"
    t.string "email"
    t.string "specialty"
  end

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
  end

end
