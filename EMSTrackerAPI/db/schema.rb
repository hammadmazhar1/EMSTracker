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

ActiveRecord::Schema.define(:version => 20150512154857) do

  create_table "cases", :force => true do |t|
    t.datetime "day_called"
    t.string   "time_called"
    t.datetime "day_resolved"
    t.string   "time_resolved"
    t.string   "patient"
    t.string   "mfr"
    t.string   "location"
    t.string   "details"
  end

  create_table "users", :force => true do |t|
    t.string  "username"
    t.string  "password_digest"
    t.boolean "mfr"
    t.string  "name"
    t.string  "rollno"
    t.string  "phoneno"
  end

end
