require 'test_helper'

class TopTest < ActionDispatch::IntegrationTest
  test 'top' do
    get root_url
    assert_select 'h2', 'Ranking'
    assert_select '.list-group-item', 'フード・ドリンク・スイーツ'
    
    assert_select '.media'
  end
end
