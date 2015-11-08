require 'open-uri'
require 'dotenv'
require 'nokogiri'
require 'logger'

Dotenv.load

class Moshimo
  AUTHORIZATION_CODE = ENV["AUTHORIZATION_CODE"]  

  def initialize
    @logger = Logger.new('moshimo.log')
    @search2 = 'http://api.moshimo.com/article/search2'
  end

  def get_ranking(category = '01')
    ranking = []
    doc = get_data(category)

    doc.xpath('//Article').each do |node|
      article_id = node.xpath('ArticleId').text
      ranking.push article_id
    end
    ranking
  end

  private
    def get_data(category)
      url = @search2 + "&authorization_code=#{AUTHORIZATION_CODE}" + "&article_category_code=#{category}"
      data = 'test.xml'
      unless File.exists?(data)
        data = url
      end
      begin
        doc = Nokogiri::XML(open(data))
      rescue => e
        @logger.error e
      end

      doc
    end

    def save_data
    end
end

m = Moshimo.new
m.get_ranking
