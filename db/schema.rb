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

ActiveRecord::Schema.define(version: 20160324022846) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.integer  "poll_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "category_rate"
  end

  create_table "formquestions", force: :cascade do |t|
    t.string   "question_name"
    t.integer  "form_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "evaluate_method", limit: 2, default: 0
  end

  add_index "formquestions", ["form_id"], name: "index_formquestions_on_form_id"

  create_table "forms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "score_category", default: 0
  end

  create_table "polls", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "poll_rate"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "question_rate"
    t.text     "question_comment"
  end

end
