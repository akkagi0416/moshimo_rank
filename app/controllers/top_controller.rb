class TopController < ApplicationController
  include ApplicationHelper

  def index
    @rankings = get_ranking(category: '01')
  end
end
