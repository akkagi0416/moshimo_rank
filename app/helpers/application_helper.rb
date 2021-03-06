module ApplicationHelper
  def get_ranking(args)
    # Ranking.where(created_at: 1.day.ago.all_day).where("category = ?", args[:category]).
    Ranking.where(created_at: Time.now.all_day).where("category = ?", args[:category]).
      paginate(page: params[:page], per_page: 20)
  end
end
