# TODO: 感想、購入理由の取得

require 'open-uri'
require 'dotenv'
require 'nokogiri'

Dotenv.load
AUTHORIZATION_CODE = ENV['AUTHORIZATION_CODE']

namespace :moshimo do
  desc 'moshimo apiでランキング取得&保存'
  logger = Logger.new("#{Rails.root}/log/moshimo.log")


  task make_ranking: :environment do
    categories = 1.upto(10).map{|i| "%02d" % i } # ( '01', '02'...'10' )
    categories.push('jun', 'all')                # junゼミ検索と全商品を追加
    categories.each do |category|
      doc = get_data(category)
      save_data(category, doc)
      logger.info "category(#{category}) finish"
    end
    logger.info 'finish make_ranking'
  end

  def get_data(category)
    url_base = "http://api.moshimo.com/article/search2" +
               "&authorization_code=#{AUTHORIZATION_CODE}" +
               "&sort_order=sales" +
               "&list_per_page=100"
    # categoryごとにapi変数を変更
    if category =~ /\d\d/
      url = url_base + "&article_category_code=#{category}"
    elsif category == 'jun'
      url = url_base + "&words=br" + "&default_profit_price_from=2000"
    elsif category == 'all'
      url = url_base + "&words=br"    # wordsのbr検索で全件対象
    else
      url = url_base + "&article_category_code=01"
    end

    begin
      doc = Nokogiri::XML(open(url))
      # doc = Nokogiri::XML(open("#{Rails.root}/lib/tasks/test.xml"))
    rescue => e
      logger.error e
    end
    
    doc
  end

  def save_data(category, doc)
    return if save_already?(category)
    doc.xpath('//Article').each_with_index do |node, i|
      article_id = node.xpath('ArticleId').text.to_i
      Ranking.create(category: category, ranking: i + 1, article_id: article_id)
      save_article(node) unless Article.find_by(article_id: article_id)
    end
  end

  def save_already?(category)
    Ranking.where(created_at: Time.now.all_day).where("category = ?", category).count != 0 ? true : false
  end

  def save_article(node)
    Article.create(
      article_id:           node.xpath('ArticleId').text.to_i,
      name:                 node.xpath('Name[1]').text,
      description:          node.xpath('Description').text,
      special_description:  node.xpath('SpecialDescription').text,
      spec:                 node.xpath('Spec').text,
      catch_copy:           node.xpath('CatchCopy').text,
      maker_name:           node.xpath('MakerName').text,
      model_number:         node.xpath('ModelNumber').text,
      tag:                  node.xpath('Tag').text,
      is_newly:             node.xpath('IsNewly').text.to_i == 1 ? true : false,
      heavy_seller:         node.xpath('HeavySeller').text.to_i == 1 ? true :false,
      is_deliver_sameday:   node.xpath('IsDeliverySameday').text.to_i == 1 ? true : false,
      is_free_shipping:     node.xpath('IsFreeShipping').text.to_i == 1 ? true : false,
      dod_from:             node.xpath('DodFrom').text.to_i,
      dod_to:               node.xpath('DodTo').text.to_i,
      preorder_flag:        node.xpath('PreorderFlag').text.to_i == 1 ? true : false,
      preorder_period:      node.xpath('PreorderPeriod').text,
      category_code:        node.xpath('Category/Code').text,
      category_name:        node.xpath('Category/Name').text,
      categorylevel:        node.xpath('Category/Level').text.to_i,
      group_id:             node.xpath('GroupId').text.to_i,
      image_code:           node.xpath('ImageCode').text,
      image_count:          node.xpath('ImageCount').text.to_i,
      jan_code:             node.xpath('JanCode').text,
      payment_type:         node.xpath('PaymentType').text.to_i,
      bundle_impossible:    node.xpath('BundleImpossible').text.to_i == 1 ? true : false,
      start_date:           Time.parse(node.xpath('StartDate').text).to_datetime,
      has_material:         node.xpath('HasMaterial').text.to_i == 1 ? true : false,
      fixed_price:          node.xpath('FixedPrice').text.to_i,
      default_profit_price: node.xpath('DefaultProfitPrice').text.to_i,
      default_profit_rate:  node.xpath('DefaultProfitRate').text.to_i,
      recommended_price:    node.xpath('RcommndedPrice').text.to_i,
      minimum_price:        node.xpath('MinimumPrice').text.to_i,
      wholesale_price:      node.xpath('WholesalePrice').text.to_i,
      shop_price:           node.xpath('ShopPrice').text.to_i,
      stock_status:         node.xpath('StockStatus').text.to_i,
      stock_status_word:    node.xpath('StockStatusWord').text,
    )
  end
end
