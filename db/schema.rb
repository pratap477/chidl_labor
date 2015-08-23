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

ActiveRecord::Schema.define(version: 20150622194132) do

  create_table "acts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "law_id",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "acts", ["law_id"], name: "index_acts_on_law_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "address_line_1", limit: 255
    t.string   "address_line_2", limit: 255
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.string   "pincode",        limit: 255
    t.integer  "employer_id",    limit: 4
    t.integer  "raid_id",        limit: 4
    t.integer  "child_id",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "addresses", ["child_id"], name: "index_addresses_on_child_id", using: :btree
  add_index "addresses", ["employer_id"], name: "index_addresses_on_employer_id", using: :btree
  add_index "addresses", ["raid_id"], name: "index_addresses_on_raid_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "answer",      limit: 255
    t.integer  "question_id", limit: 4
    t.integer  "child_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "answers", ["child_id"], name: "index_answers_on_child_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.integer  "raid_id",           limit: 4
    t.integer  "child_id",          limit: 4
    t.integer  "employer_id",       limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "attachments", ["child_id"], name: "index_attachments_on_child_id", using: :btree
  add_index "attachments", ["employer_id"], name: "index_attachments_on_employer_id", using: :btree
  add_index "attachments", ["raid_id"], name: "index_attachments_on_raid_id", using: :btree

  create_table "children", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "father_name",     limit: 255
    t.string   "mother_name",     limit: 255
    t.string   "gender",          limit: 255
    t.integer  "age",             limit: 4
    t.boolean  "is_child_begger", limit: 1,     default: false
    t.integer  "employer_id",     limit: 4
    t.integer  "raid_id",         limit: 4
    t.text     "description",     limit: 65535
    t.boolean  "is_deleted",      limit: 1,     default: false
    t.string   "submited_by",     limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "pet_name",        limit: 255
    t.string   "mother_tongue",   limit: 255
  end

  add_index "children", ["employer_id"], name: "index_children_on_employer_id", using: :btree
  add_index "children", ["raid_id"], name: "index_children_on_raid_id", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "community_farms", force: :cascade do |t|
    t.integer  "raid_id",        limit: 4
    t.integer  "department_id",  limit: 4
    t.string   "involve_member", limit: 255
    t.string   "submited_by",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "ngo_name",       limit: 255
    t.string   "person_name",    limit: 255
  end

  add_index "community_farms", ["department_id"], name: "index_community_farms_on_department_id", using: :btree
  add_index "community_farms", ["raid_id"], name: "index_community_farms_on_raid_id", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "middle_name",    limit: 255
    t.string   "last_name",      limit: 255
    t.string   "contact_no",     limit: 255
    t.string   "email",          limit: 255
    t.string   "area",           limit: 255
    t.string   "subject",        limit: 255
    t.datetime "last_seen_date"
    t.string   "description",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "employer_id",    limit: 4
  end

  add_index "complaints", ["employer_id"], name: "index_complaints_on_employer_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "location_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "departments", ["location_id"], name: "index_departments_on_location_id", using: :btree

  create_table "employer_sections", force: :cascade do |t|
    t.string   "laws",        limit: 255
    t.string   "acts",        limit: 255
    t.string   "sections",    limit: 255
    t.integer  "employer_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employer_sections", ["employer_id"], name: "index_employer_sections_on_employer_id", using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "middle_name",   limit: 255
    t.string   "last_name",     limit: 255
    t.string   "contact_no",    limit: 255
    t.integer  "raid_id",       limit: 4
    t.boolean  "is_deleted",    limit: 1,   default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "shop_act_lnc",  limit: 255
    t.string   "industry_type", limit: 255
    t.boolean  "is_adhar_card", limit: 1
    t.boolean  "is_voter_card", limit: 1
    t.boolean  "is_pan_card",   limit: 1
    t.string   "adhar_card",    limit: 255
    t.string   "voter_card",    limit: 255
    t.string   "pan_card",      limit: 255
  end

  add_index "employers", ["raid_id"], name: "index_employers_on_raid_id", using: :btree

  create_table "laws", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question",         limit: 255
    t.boolean  "is_yes_no_answer", limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "raids", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.datetime "datetime"
    t.string   "description",  limit: 255
    t.string   "raid_for",     limit: 255
    t.integer  "location_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "complaint_id", limit: 4
  end

  add_index "raids", ["complaint_id"], name: "index_raids_on_complaint_id", using: :btree
  add_index "raids", ["location_id"], name: "index_raids_on_location_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "act_id",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sections", ["act_id"], name: "index_sections_on_act_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "title",                  limit: 255
    t.string   "first_name",             limit: 255
    t.string   "middle_name",            limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "contact_no",             limit: 255
    t.integer  "role_id",                limit: 4
    t.integer  "department_id",          limit: 4
    t.string   "designation",            limit: 255
    t.boolean  "is_deleted",             limit: 1,   default: false
    t.boolean  "is_primary",             limit: 1,   default: false
    t.integer  "community_id",           limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.integer  "current_sign_in_ip",     limit: 4
    t.integer  "last_sign_in_ip",        limit: 4
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["community_id"], name: "index_users_on_community_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "acts", "laws"
  add_foreign_key "addresses", "children"
  add_foreign_key "addresses", "employers"
  add_foreign_key "addresses", "raids"
  add_foreign_key "answers", "children"
  add_foreign_key "answers", "questions"
  add_foreign_key "attachments", "children"
  add_foreign_key "attachments", "employers"
  add_foreign_key "attachments", "raids"
  add_foreign_key "children", "employers"
  add_foreign_key "children", "raids"
  add_foreign_key "community_farms", "departments"
  add_foreign_key "community_farms", "raids"
  add_foreign_key "complaints", "employers"
  add_foreign_key "departments", "locations"
  add_foreign_key "employer_sections", "employers"
  add_foreign_key "employers", "raids"
  add_foreign_key "raids", "complaints"
  add_foreign_key "raids", "locations"
  add_foreign_key "sections", "acts"
  add_foreign_key "users", "communities"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
end
