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

ActiveRecord::Schema.define(version: 20151111231938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "account_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.date     "date_of_birth"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "registered_at"
    t.date     "registered_until"
    t.integer  "period"
    t.integer  "owner_id"
  end

  add_index "dogs", ["owner_id"], name: "index_dogs_on_owner_id", using: :btree
  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.text     "postal_address"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "owners", ["user_id"], name: "index_owners_on_user_id", using: :btree

  create_table "registers", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "dog_id"
    t.date     "registered_on"
    t.date     "registered_until"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "registers", ["dog_id"], name: "index_registers_on_dog_id", using: :btree
  add_index "registers", ["owner_id"], name: "index_registers_on_owner_id", using: :btree

  create_table "registration_periods", force: :cascade do |t|
    t.integer  "length"
    t.string   "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.date     "registered_at"
    t.date     "registered_until"
    t.integer  "owner_id"
    t.integer  "dog_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "registrations", ["dog_id"], name: "index_registrations_on_dog_id", using: :btree
  add_index "registrations", ["owner_id"], name: "index_registrations_on_owner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "dogs", "owners"
  add_foreign_key "dogs", "users"
  add_foreign_key "owners", "users"
  add_foreign_key "registers", "dogs"
  add_foreign_key "registers", "owners"
  add_foreign_key "registrations", "dogs"
  add_foreign_key "registrations", "owners"
end
