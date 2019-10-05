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

ActiveRecord::Schema.define(version: 2019_10_03_200135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.integer "quantity"
    t.boolean "picked_up", default: false, null: false
    t.boolean "active", default: true, null: false
    t.bigint "surplu_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_claims_on_organization_id"
    t.index ["surplu_id"], name: "index_claims_on_surplu_id"
  end

  create_table "fulfillments", force: :cascade do |t|
    t.integer "quantity"
    t.boolean "received", default: false, null: false
    t.boolean "active", default: true, null: false
    t.bigint "need_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["need_id"], name: "index_fulfillments_on_need_id"
    t.index ["organization_id"], name: "index_fulfillments_on_organization_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id", "user_id"], name: "index_memberships_on_role_id_and_user_id", unique: true
    t.index ["role_id"], name: "index_memberships_on_role_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "needs", force: :cascade do |t|
    t.string "resource"
    t.string "description"
    t.integer "quantity"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_needs_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "surplus", force: :cascade do |t|
    t.string "resource"
    t.string "description"
    t.integer "quantity"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_surplus_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "claims", "organizations"
  add_foreign_key "claims", "surplus"
  add_foreign_key "fulfillments", "needs"
  add_foreign_key "fulfillments", "organizations"
  add_foreign_key "memberships", "roles"
  add_foreign_key "memberships", "users"
  add_foreign_key "needs", "organizations"
  add_foreign_key "surplus", "organizations"
end
