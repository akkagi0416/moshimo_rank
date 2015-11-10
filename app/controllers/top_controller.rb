class TopController < ApplicationController
  include ApplicationHelper

  def index
    @rankings = get_ranking(category: params[:category])
  end
end
