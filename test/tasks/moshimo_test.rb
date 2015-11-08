require 'test_helper'
require 'rake'

class MoshimoTest < ActiveSupport::TestCase
  # @rake = Rake::Application.new
  # Rake.application = @rake
  Rake.application.rake_require "tasks/moshimo"
  Rake::Task.define_task(:environment)

  def setup
    Rake.application.invoke_task "moshimo:make_ranking"
    Rake::Task["moshimo:make_ranking"].reenable
  end

  test "the truth" do
    assert true
  end

  test "moshimo:make_ranking" do
    first_id = Ranking.first.article_id
    assert_match /\d+/, first_id.to_s
    # dbに保存できていること
    assert_not_equal 0, Ranking.count
    # dbに重複して保存していないこと
    assert_equal 1, Ranking.where(article_id: first_id).count
  end
end
