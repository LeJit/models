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

ActiveRecord::Schema.define(:version => 20111029223430) do

  create_table "bank_accts", :force => true do |t|
    t.integer  "AcctNum"
    t.integer  "member_id"
    t.integer  "Amt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bidder_period_items", :force => true do |t|
    t.integer  "bidding_period_id"
    t.integer  "member_id"
    t.integer  "item_id"
    t.integer  "AmtBid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bidding_periods", :force => true do |t|
    t.date     "StartDt"
    t.date     "EndDt"
    t.integer  "item_id"
    t.integer  "NumPeriods"
    t.integer  "Status"
    t.integer  "BiddingCap"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "Name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "Name"
    t.string   "category_id"
    t.integer  "SellerID"
    t.integer  "Status"
    t.string   "Condition"
    t.integer  "BuyerID"
    t.integer  "PriceSet"
    t.integer  "PriceSold"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "Email"
    t.string   "Password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
