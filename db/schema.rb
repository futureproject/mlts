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

ActiveRecord::Schema.define(version: 20180201175139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "change_agents", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "location"
    t.string   "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "link"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "education_facts", force: :cascade do |t|
    t.text    "quote"
    t.string  "source"
    t.string  "link"
    t.string  "category"
    t.boolean "hidden",   default: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "quotes", force: :cascade do |t|
    t.string   "author"
    t.text     "quote_text"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screenings", force: :cascade do |t|
    t.datetime "screening_time"
    t.string   "city"
    t.string   "country"
    t.string   "link"
    t.string   "venue_name"
    t.string   "street_address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "state"
    t.string   "identifier"
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "name"
    t.string   "business_title"
    t.text     "bio"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.integer  "position"
    t.string   "description"
    t.string   "video_embed"
    t.string   "video_title"
    t.string   "video_description"
    t.string   "take_action_title"
    t.string   "audio_embed"
    t.string   "audio_title"
    t.string   "audio_description"
    t.text     "take_action_text"
    t.string   "targeted_location"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "color"
    t.string   "act_image_file_name"
    t.string   "act_image_content_type"
    t.integer  "act_image_file_size"
    t.datetime "act_image_updated_at"
    t.text     "audio_transcript"
  end

end
