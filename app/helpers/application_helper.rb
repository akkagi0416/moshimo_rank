module ApplicationHelper
  def get_ranking(category: '01')
    Ranking.where(created_at: 1.day.ago.all_day).where("category = ?", category).
      paginate(page: params[:page], per_page: 10)
  end
end
