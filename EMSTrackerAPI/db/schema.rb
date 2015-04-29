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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150422084845) do

  create_table "emergencies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mfr_id"
    t.string   "location"
    t.string   "severity"
    t.datetime "resolve_time"
    t.boolean  "hospital_visted"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "mfr_id"
    t.string   "gps_latitude"
    t.string   "gps_longitude"
    t.string   "gen_location"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "mfrs", :force => true do |t|
    t.string "username"
    t.string "password"
    t.string "rollno"
    t.string "name"
    t.string "gender"
    t.string "phoneno"
  end

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "password"
    t.string "rollno"
    t.string "phoneno"
    t.string "gender"
  end

end
