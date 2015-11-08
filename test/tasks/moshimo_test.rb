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
    assert_match /\d+/, Ranking.first.article_id.to_s
    assert_not_equal 0, Ranking.count
  end

end
