require 'test_helper'

class RankingTest < ActiveSupport::TestCase
  def setup
    @ranking = rankings(:one)
    @item = articles(:item1)
  end

  test 'Ranking & Article relation' do
    assert_equal @ranking.ranking, 1
    assert_equal @item.default_profit_price, 100
    assert_equal @ranking.article.default_profit_price, 100
  end
end
