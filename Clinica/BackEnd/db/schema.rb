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

ActiveRecord::Schema.define(version: 20160802151703) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "type_appointment_id"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "doctor_id"
    t.integer  "estate_id"
    t.date     "date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["estate_id"], name: "index_appointments_on_estate_id"
    t.index ["type_appointment_id"], name: "index_appointments_on_type_appointment_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.integer  "level_doctor_id"
    t.integer  "estate_id"
    t.date     "admission_date"
    t.integer  "clinic_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["clinic_id"], name: "index_doctors_on_clinic_id"
    t.index ["estate_id"], name: "index_doctors_on_estate_id"
    t.index ["level_doctor_id"], name: "index_doctors_on_level_doctor_id"
  end

  create_table "estates", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "level_doctors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "number_of_request", default: 0
    t.string   "name"
    t.integer  "estate_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["estate_id"], name: "index_tokens_on_estate_id"
  end

  create_table "type_appointments", force: :cascade do |t|
    t.string   "codigo"
    t.string   "description"
    t.integer  "priority"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_identifications", force: :cascade do |t|
    t.string   "codigo"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.integer  "type_identification_id"
    t.string   "identification"
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "estate_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["estate_id"], name: "index_users_on_estate_id"
    t.index ["type_identification_id"], name: "index_users_on_type_identification_id"
  end

end
