class RankingsController < ApplicationController
  include ApplicationHelper

  def index
    @rankings = get_ranking(params[:category])
  end
end
