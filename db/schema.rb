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

ActiveRecord::Schema.define(version: 20140530131316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "accounts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.integer  "social_score",        default: 0
    t.string   "token"
    t.boolean  "registered",          default: false
    t.string   "phone"
    t.integer  "moves_count",         default: 0
    t.integer  "joker_count",         default: 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["phone"], name: "index_accounts_on_phone", using: :btree

  create_table "activities", force: true do |t|
    t.integer  "subject_id"
    t.integer  "activity_type",      default: 0
    t.integer  "target_id"
    t.string   "message"
    t.integer  "likes_count",        default: 0
    t.integer  "comments_count",     default: 0
    t.hstore   "data"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "urgent",             default: false
  end

  add_index "activities", ["activity_type"], name: "index_activities_on_activity_type", using: :btree
  add_index "activities", ["data"], name: "activities_gin_data", using: :gin
  add_index "activities", ["subject_id"], name: "index_activities_on_subject_id", using: :btree
  add_index "activities", ["target_id"], name: "index_activities_on_target_id", using: :btree
  add_index "activities", ["urgent"], name: "index_activities_on_urgent", using: :btree

  create_table "comments", force: true do |t|
    t.string   "message"
    t.integer  "activity_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["account_id"], name: "index_comments_on_account_id", using: :btree
  add_index "comments", ["activity_id"], name: "index_comments_on_activity_id", using: :btree

  create_table "friends", force: true do |t|
    t.integer  "account_id"
    t.integer  "friend_id"
    t.integer  "rank"
    t.integer  "bond",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "social_score", default: 0
  end

  add_index "friends", ["account_id"], name: "index_friends_on_account_id", using: :btree
  add_index "friends", ["friend_id"], name: "index_friends_on_friend_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "account_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["account_id"], name: "index_likes_on_account_id", using: :btree
  add_index "likes", ["activity_id"], name: "index_likes_on_activity_id", using: :btree

  create_table "moment_categories", force: true do |t|
    t.string   "text"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
