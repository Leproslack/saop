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

ActiveRecord::Schema.define(version: 20160310145755) do

  create_table "polls", force: :cascade do |t|
    t.float    "cat1"
    t.integer  "a11"
    t.text     "ac11"
    t.integer  "a12"
    t.text     "ac12"
    t.integer  "a13"
    t.text     "ac13"
    t.float    "cat2"
    t.integer  "a21"
    t.text     "ac21"
    t.integer  "a22"
    t.text     "ac22"
    t.float    "cat3"
    t.integer  "a31"
    t.text     "ac31"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "poll_rate"
    t.string   "name"
  end

end
