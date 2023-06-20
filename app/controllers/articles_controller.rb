class ArticlesController < ApplicationController
  def get_article(id)
    @article = Article.find(id)
  end
  
  def index
    @articles = Article.all
    render template: "articles/index"
  end

  def show
    get_article(params[:id])
    render template: "articles/show"
  end
end
