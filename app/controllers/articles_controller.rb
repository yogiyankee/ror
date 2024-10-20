class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
    else
     @articles = Article.all
     render :index
    end
  end

  private
    def article_params
      params.require(:article).permit(:name)
    end

end
