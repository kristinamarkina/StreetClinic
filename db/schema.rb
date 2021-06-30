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

ActiveRecord::Schema.define(version: 2021_06_30_230041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "sex"
    t.string "ethnicity"
    t.boolean "prev_etoh_use"
    t.boolean "curr_etoh_use"
    t.text "etoh_notes"
    t.boolean "prev_smoking"
    t.boolean "curr_smoking"
    t.text "smoking_notes"
    t.boolean "prev_drug_use"
    t.boolean "curr_drug_use"
    t.text "drug_notes"
    t.text "illnesses"
    t.text "surgeries"
    t.text "allergies"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.string "languages"
    t.string "specialty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "visit_datetime"
    t.float "temperature"
    t.float "height"
    t.float "weight"
    t.integer "pulse"
    t.integer "bp_sys"
    t.integer "bd_dia"
    t.text "complaint"
    t.text "referrals"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
