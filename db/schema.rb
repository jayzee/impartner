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


ActiveRecord::Schema.define(version: 20160415142406) do

  create_table "answers", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "assessment_id"
    t.integer  "total_point_value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "question_id"
    t.string   "content"
  end

  create_table "assessments", force: :cascade do |t|
    t.integer  "lesson_id"
    t.boolean  "challenge?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.integer  "track_id"
    t.string   "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.string   "answer"
    t.integer  "points_value"
    t.integer  "assessment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "content"
    t.string   "type_of"
    t.integer  "lesson_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
    t.string   "description"
    t.string   "title"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "students_assessments", force: :cascade do |t|
    t.integer "student_id"
    t.integer "assessment_id"
    t.boolean "completed",     default: false
    t.integer "points"
  end

  create_table "students_lessons", force: :cascade do |t|
    t.integer "student_id"
    t.integer "lesson_id"
    t.boolean "completed",  default: false
  end

  create_table "students_resources", force: :cascade do |t|
    t.integer "student_id"
    t.integer "resource_id"
    t.boolean "completed",   default: false
  end

  create_table "students_tracks", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "track_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "completed",  default: false
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.boolean  "privacy"
    t.integer  "teacher_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "name"
    t.string   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "points",                 default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
