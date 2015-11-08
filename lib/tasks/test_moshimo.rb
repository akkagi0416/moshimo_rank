require 'test/unit'
require './moshimo.rb'

class TestCase < Test::Unit::TestCase
  def setup
    @m = Moshimo.new
  end

  test 'xmlデータから1位を取得' do
    assert_equal '112257', @m.get_ranking[0]
  end
end
