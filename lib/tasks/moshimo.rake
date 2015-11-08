require 'open-uri'
require 'dotenv'
require 'nokogiri'

Dotenv.load
AUTHORIZATION_CODE = ENV['AUTHORIZATION_CODE']

namespace :moshimo do
  desc 'moshimo apiでランキング取得&保存'
  logger = Logger.new("#{Rails.root}/log/moshimo.log")

  task make_ranking: :environment do
    doc = get_data('01')
    save_data('01', doc)

    logger.info 'finish make_ranking'
  end

  def get_data(category)
    url = "http://api.moshimo.com/article/search2" +
          "&authorization_code=#{AUTHORIZATION_CODE}" +
          "&article_category_code=#{category}"

    begin
      doc = Nokogiri::XML(open(url))
    rescue => e
      logger.error e
    end
    
    doc
  end

  def save_data(category, doc)
    doc.xpath('//Article').each_with_index do |node, i|
      article_id = node.xpath('ArticleId').text
      # その日初めてならdbへ保存
      if Ranking.where(created_at: Time.now.all_day).where("category = ?", category).count == 0
        Ranking.create(category: category, ranking: i + 1, article_id: article_id)
      end
    end
  end
end
