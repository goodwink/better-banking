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

ActiveRecord::Schema.define(:version => 20110615214356) do

  create_table "account_products", :id => false, :force => true do |t|
    t.integer  "id",                               :null => false
    t.string   "name",               :limit => 50, :null => false
    t.integer  "account_subtype_id",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_subtypes", :id => false, :force => true do |t|
    t.integer  "id",                            :null => false
    t.integer  "account_type_id", :limit => 2
    t.string   "name",            :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_types", :id => false, :force => true do |t|
    t.string   "name",           :limit => 50, :null => false
    t.integer  "id",             :limit => 2,  :null => false
    t.integer  "normal_balance", :limit => 2,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", :id => false, :force => true do |t|
    t.integer  "id",                 :limit => 8,  :null => false
    t.string   "number",             :limit => 17, :null => false
    t.integer  "account_product_id",               :null => false
    t.string   "name",               :limit => 50
    t.integer  "customer_id",        :limit => 8,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["number", "account_product_id"], :name => "accounts_number_account_product_id_key", :unique => true

  create_table "customers", :id => false, :force => true do |t|
    t.integer  "id",                         :null => false
    t.string   "name",        :limit => 100, :null => false
    t.string   "address1",    :limit => 50,  :null => false
    t.string   "address2",    :limit => 50
    t.string   "city",        :limit => 35,  :null => false
    t.string   "state",       :limit => 2,   :null => false
    t.string   "zip",         :limit => 9,   :null => false
    t.boolean  "is_business",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :id => false, :force => true do |t|
    t.integer  "id",          :limit => 8,   :null => false
    t.integer  "offset_id",   :limit => 8,   :null => false
    t.integer  "account_id",  :limit => 8,   :null => false
    t.integer  "amount",      :limit => 8,   :null => false
    t.string   "description", :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
