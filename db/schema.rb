# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100415022453) do

  create_table "country_groups", :force => true do |t|
    t.string  "country"
    t.integer "group_id"
  end

  create_table "customers", :force => true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "street_address"
    t.string "zip_code"
    t.string "state"
    t.string "country"
    t.string "city"
    t.string "shipping_method"
  end

  create_table "orders", :force => true do |t|
    t.integer "transaction_id"
    t.integer "product_id"
    t.integer "quantity"
  end

  create_table "products", :force => true do |t|
    t.string  "name"
    t.string  "byline"
    t.text    "description"
    t.integer "price"
    t.integer "weight"
  end

  create_table "shipping_rates", :force => true do |t|
    t.float   "from_weight"
    t.float   "to_weight"
    t.string  "method"
    t.float   "rate"
    t.integer "country_group"
  end

  create_table "shopping_transaction_statuses", :force => true do |t|
    t.string "status"
    t.string "description"
  end

  create_table "shopping_transactions", :force => true do |t|
    t.datetime "date"
    t.integer  "status_transaction_id"
    t.integer  "total"
    t.integer  "customer_id"
  end

  create_table "tax_rates", :force => true do |t|
    t.float  "rate"
    t.string "state"
    t.string "country"
  end

end
