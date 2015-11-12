class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(article_id: params[:id])
    @rankings = @article.rankings
    @category = @article.category_code[0..1]    # category取得 '01'など
  end
end
