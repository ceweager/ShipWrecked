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

ActiveRecord::Schema.define(version: 2021_07_10_175931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "birthday"
    t.string "sexuality"
    t.text "positive"
    t.text "negative"
    t.text "personality"
    t.text "history"
    t.text "other"
    t.text "overview"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "character_pic"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "partner_id"
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "connects", force: :cascade do |t|
    t.bigint "relationship_id", null: false
    t.bigint "postthread_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["postthread_id"], name: "index_connects_on_postthread_id"
    t.index ["relationship_id"], name: "index_connects_on_relationship_id"
  end

  create_table "friendship_invites", force: :cascade do |t|
    t.integer "friend_id"
    t.bigint "user_id", null: false
    t.boolean "user_confirm"
    t.boolean "friend_confirm"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_friendship_invites_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.string "goal_name"
    t.text "goal_detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_goals_on_character_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.string "milestone_name"
    t.text "model_overview"
    t.bigint "goal_id", null: false
    t.string "milestone_pic_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_milestones_on_goal_id"
  end

  create_table "postthreads", force: :cascade do |t|
    t.string "thread_name"
    t.string "thread_status"
    t.bigint "milestone_id", null: false
    t.text "thread_detail"
    t.string "thread_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["milestone_id"], name: "index_postthreads_on_milestone_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "relation_name"
    t.string "relation_status"
    t.text "relation_detail"
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "relation_pic"
    t.index ["character_id"], name: "index_relationships_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "age"
    t.string "pronouns"
    t.string "timezone"
    t.text "about"
    t.string "avatar"
    t.boolean "admin"
    t.string "preferences"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "characters", "users"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "connects", "postthreads"
  add_foreign_key "connects", "relationships"
  add_foreign_key "friendship_invites", "users"
  add_foreign_key "goals", "characters"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "milestones", "goals"
  add_foreign_key "postthreads", "milestones"
  add_foreign_key "relationships", "characters"
end
