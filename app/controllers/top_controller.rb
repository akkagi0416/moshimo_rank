class TopController < ApplicationController
  include ApplicationHelper

  def index
    category = params[:category] || '01'
    @rankings = get_ranking(category: category)
  end
end
