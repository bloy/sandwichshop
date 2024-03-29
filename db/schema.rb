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

ActiveRecord::Schema.define(:version => 20120512160041) do

  create_table "breads", :force => true do |t|
    t.string "name",        :null => false
    t.string "description", :null => false
  end

  create_table "sandwich_sizes", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "sandwiches", :force => true do |t|
    t.datetime "ordered_at",       :null => false
    t.datetime "completed_at"
    t.integer  "ordered_by_id",    :null => false
    t.integer  "completed_by_id"
    t.integer  "bread_id",         :null => false
    t.integer  "sandwich_size_id", :null => false
  end

  add_index "sandwiches", ["bread_id"], :name => "index_sandwiches_on_bread_id"
  add_index "sandwiches", ["completed_by_id"], :name => "index_sandwiches_on_completed_by_id"
  add_index "sandwiches", ["ordered_by_id"], :name => "index_sandwiches_on_ordered_by_id"
  add_index "sandwiches", ["sandwich_size_id"], :name => "index_sandwiches_on_sandwich_size_id"

  create_table "sandwiches_toppings", :force => true do |t|
    t.integer "sandwich_id", :null => false
    t.integer "topping_id",  :null => false
  end

  create_table "topping_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "toppings", :force => true do |t|
    t.string  "name",            :null => false
    t.integer "topping_type_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                            :null => false
    t.string   "last_name",                             :null => false
    t.string   "email",                                 :null => false
    t.string   "crypted_password",                      :null => false
    t.string   "password_salt",                         :null => false
    t.string   "persistence_token",                     :null => false
    t.integer  "login_count",        :default => 0,     :null => false
    t.integer  "failed_login_count", :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "admin",              :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
