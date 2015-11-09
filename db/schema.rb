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

ActiveRecord::Schema.define(version: 20151108124524) do

  create_table "articles", primary_key: "article_id", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "special_description"
    t.text     "spec"
    t.text     "catch_copy"
    t.text     "maker_name"
    t.string   "model_number"
    t.string   "tag"
    t.boolean  "is_newly"
    t.boolean  "heavy_seller"
    t.boolean  "is_deliver_sameday"
    t.boolean  "is_free_shipping"
    t.integer  "dod_from"
    t.integer  "dod_to"
    t.boolean  "preorder_flag"
    t.string   "preorder_period"
    t.string   "category_code"
    t.string   "category_name"
    t.integer  "categorylevel"
    t.integer  "group_id"
    t.string   "image_code"
    t.integer  "image_count"
    t.string   "jan_code"
    t.integer  "payment_type"
    t.boolean  "bundle_impossible"
    t.datetime "start_date"
    t.boolean  "has_material"
    t.integer  "fixed_price"
    t.integer  "default_profit_price"
    t.integer  "default_profit_rate"
    t.integer  "recommended_price"
    t.integer  "minimum_price"
    t.integer  "wholesale_price"
    t.integer  "shop_price"
    t.integer  "stock_status"
    t.string   "stock_status_word"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "category"
    t.integer  "ranking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rankings", ["article_id"], name: "index_rankings_on_article_id"

end
