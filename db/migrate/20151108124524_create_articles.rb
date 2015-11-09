class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, id: false do |t|
      t.column   :article_id,  "INTEGER PRIMARY KEY NOT NULL"
      t.string   :name
      t.text     :description
      t.text     :special_description
      t.text     :spec
      t.text     :catch_copy
      t.text     :maker_name
      t.string   :model_number
      t.string   :tag
      t.boolean  :is_newly
      t.boolean  :heavy_seller
      t.boolean  :is_deliver_sameday
      t.boolean  :is_free_shipping
      t.integer  :dod_from
      t.integer  :dod_to
      t.boolean  :preorder_flag
      t.string   :preorder_period
      t.string   :category_code
      t.string   :category_name
      t.integer  :categorylevel
      t.integer  :group_id
      t.string   :image_code
      t.integer  :image_count
      t.string   :jan_code
      t.integer  :payment_type
      t.boolean  :bundle_impossible
      t.datetime :start_date
      t.boolean  :has_material
      t.integer  :fixed_price
      t.integer  :default_profit_price
      t.integer  :default_profit_rate
      t.integer  :recommended_price
      t.integer  :minimum_price
      t.integer  :wholesale_price
      t.integer  :shop_price
      t.integer  :stock_status
      t.string   :stock_status_word

      t.timestamps null: false
    end

  end
end
