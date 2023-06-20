class ArticlesController < ApplicationController
  def get_article
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
    render template: "articles/index"
  end
end
