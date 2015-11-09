class TopController < ApplicationController
  def index
    @rankings = Ranking.where(created_at: Time.now.all_day).where(category: '01')
      .paginate(page: params[:page], per_page: 10)
  end
end
