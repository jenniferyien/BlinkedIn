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

ActiveRecord::Schema.define(version: 20151008154543) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnis", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.text     "about"
    t.text     "q1"
    t.text     "q2"
    t.text     "q3"
    t.string   "position"
    t.integer  "view",        default: 0
    t.text     "fun_fact"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "avatar"
    t.string   "attachment"
  end

  add_index "alumnis", ["location_id"], name: "index_alumnis_on_location_id", using: :btree
  add_index "alumnis", ["user_id"], name: "index_alumnis_on_user_id", using: :btree

  create_table "desired_skills", force: :cascade do |t|
    t.integer  "employer_id"
    t.integer  "skill_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "desired_skills", ["employer_id"], name: "index_desired_skills_on_employer_id", using: :btree
  add_index "desired_skills", ["skill_id"], name: "index_desired_skills_on_skill_id", using: :btree

  create_table "employers", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.string   "company_name"
    t.string   "website"
    t.string   "company_type"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "avatar"
  end

  add_index "employers", ["location_id"], name: "index_employers_on_location_id", using: :btree
  add_index "employers", ["user_id"], name: "index_employers_on_user_id", using: :btree

  create_table "endorsements", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "user_id"
    t.integer  "alumni_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "endorsements", ["alumni_id"], name: "index_endorsements_on_alumni_id", using: :btree
  add_index "endorsements", ["skill_id"], name: "index_endorsements_on_skill_id", using: :btree
  add_index "endorsements", ["user_id"], name: "index_endorsements_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "alumni_id"
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["alumni_id"], name: "index_projects_on_alumni_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "auth_hash"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
    t.string   "attachment"
  end

  add_foreign_key "alumnis", "locations"
  add_foreign_key "alumnis", "users"
  add_foreign_key "desired_skills", "employers"
  add_foreign_key "desired_skills", "skills"
  add_foreign_key "employers", "locations"
  add_foreign_key "employers", "users"
  add_foreign_key "endorsements", "alumnis"
  add_foreign_key "endorsements", "skills"
  add_foreign_key "endorsements", "users"
  add_foreign_key "projects", "alumnis"
end
