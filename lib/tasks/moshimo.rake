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
    ranking = []
    doc.xpath('//Article').each_with_index do |node, i|
      article_id = node.xpath('ArticleId').text
      ranking.push article_id
      Ranking.create(category: category, ranking: i + 1, article_id: article_id)
    end
    ranking
  end
end



# class Tasks::Moshimo
#
#   def self.make_ranking
#     doc = get_data('01')
#     p doc
#   end
#
#   # private
#     def get_data(category)
#       url = "http://api.moshimo.com/article/search2"
#         + "&authorization_code=#{AUTHORIZATION_CODE}"
#         + "&article_category_code=#{category}"
#       begin
#         doc = Nokogiri::XML(open(url))
#       rescue => e
#         Rails.logger.error e
#       end
#  
#       doc
#     end
#   #
#   #   def save_data(category, doc)
#   #     ranking = []
#   #     doc.xpath('//Article').each_with_index do |node, i|
#   #       article_id = node.xpath('ArticleId').text
#   #       ranking.push article_id
#   #       Ranking.create(category: category, ranking: i + 1, article_id: article_id)
#   #     end
#   #     p Ranking.all
#   #     ranking
#   #   end
# end
