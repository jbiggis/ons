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

ActiveRecord::Schema.define(:version => 20110316100503) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "hunters", :id => false, :force => true do |t|
    t.string   "hunter_id",                   :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gender"
    t.date     "DOB"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "keys",         :default => 0, :null => false
    t.integer  "invites",      :default => 5, :null => false
    t.datetime "last_login"
    t.integer  "login_count",  :default => 0, :null => false
  end

  add_index "hunters", ["hunter_id"], :name => "index_hunters_on_hunter_id", :unique => true

  create_table "orders", :id => false, :force => true do |t|
    t.string   "order_id",              :null => false
    t.string   "hunter_id",             :null => false
    t.string   "product_id",            :null => false
    t.string   "status"
    t.string   "message"
    t.boolean  "refund_funding_source"
    t.string   "refund_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["order_id"], :name => "index_orders_on_order_id", :unique => true

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.integer  "keys_to_add"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", :force => true do |t|
    t.string   "hunter_id",   :null => false
    t.string   "target_id",   :null => false
    t.string   "name"
    t.datetime "matched_at"
    t.datetime "notified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "targets", ["hunter_id", "target_id"], :name => "index_targets_on_hunter_id_and_target_id", :unique => true
  add_index "targets", ["hunter_id"], :name => "index_targets_on_hunter_id"

end
