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

ActiveRecord::Schema.define(version: 20131020145112) do

  create_table "guest_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_updates", force: true do |t|
    t.text     "description"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset"
  end

  add_index "job_updates", ["job_id"], name: "index_job_updates_on_job_id"

  create_table "jobs", force: true do |t|
    t.string   "company_name"
    t.string   "position_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

end
