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

ActiveRecord::Schema.define(:version => 20131025163102) do

  create_table "items", :force => true do |t|
    t.string   "restaurant_id"
    t.integer  "order_id",      :limit => 255
    t.string   "item_name"
    t.string   "item_type"
    t.decimal  "item_price"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "quantity"
  end

  create_table "orders", :force => true do |t|
    t.string   "restaurant_id"
    t.integer  "user_id",       :limit => 255
    t.integer  "item_id",       :limit => 255
    t.integer  "quantity"
    t.decimal  "price_sum"
    t.decimal  "sum"
    t.decimal  "tip"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id",       :limit => 255
    t.string   "restaurant_id"
    t.string   "content"
    t.boolean  "display",                      :default => true
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
