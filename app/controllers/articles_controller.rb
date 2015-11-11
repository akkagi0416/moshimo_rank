class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(article_id: params[:id])
    @category = @article.category_code[0..2]    # category取得 '01'など
  end
end
