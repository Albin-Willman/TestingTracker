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

ActiveRecord::Schema.define(version: 201503141232546) do

  create_table "approvals", force: :cascade do |t|
    t.integer  "tester_id",  limit: 4
    t.integer  "feature_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "approvals", ["feature_id"], name: "index_approvals_on_feature_id", using: :btree
  add_index "approvals", ["tester_id"], name: "index_approvals_on_tester_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.text     "description_markdown", limit: 65535
    t.text     "description_html",     limit: 65535
    t.integer  "test_suite_id",        limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "features", ["test_suite_id"], name: "index_features_on_test_suite_id", using: :btree

  create_table "github_tokens", force: :cascade do |t|
    t.string   "access_token",  limit: 255
    t.string   "title",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "client_secret", limit: 255
    t.string   "client_id",     limit: 255
    t.string   "organization",  limit: 255
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "feature_id",           limit: 4
    t.integer  "test_suite_id",        limit: 4
    t.string   "title",                limit: 255
    t.boolean  "closed",               limit: 1
    t.integer  "number",               limit: 4
    t.text     "description_markdown", limit: 65535
    t.text     "description_html",     limit: 65535
    t.integer  "user_id",              limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "issues", ["feature_id"], name: "index_issues_on_feature_id", using: :btree
  add_index "issues", ["test_suite_id"], name: "index_issues_on_test_suite_id", using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "test_suites", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.boolean  "done",            limit: 1
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "repo",            limit: 255
    t.integer  "github_token_id", limit: 4
  end

  add_index "test_suites", ["github_token_id"], name: "index_test_suites_on_github_token_id", using: :btree

  create_table "testers", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "test_suite_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "testers", ["test_suite_id"], name: "index_testers_on_test_suite_id", using: :btree
  add_index "testers", ["user_id"], name: "index_testers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",             limit: 255
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "admin",             limit: 1
  end

  add_foreign_key "approvals", "features"
  add_foreign_key "approvals", "testers"
  add_foreign_key "features", "test_suites"
  add_foreign_key "issues", "features"
  add_foreign_key "issues", "test_suites"
  add_foreign_key "issues", "users"
  add_foreign_key "test_suites", "github_tokens"
  add_foreign_key "testers", "test_suites"
  add_foreign_key "testers", "users"
end
