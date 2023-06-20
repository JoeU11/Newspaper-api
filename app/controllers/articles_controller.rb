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

  def create
    @article = Article.new(title: params[:title], author_id: params[:author_id], text: params[:text])
    if @article.save
      render template: "articles/show"
    else
      render json: {error: "Article could not be saved"}
    end
  end

  def destroy
    get_article(params[:id])
    @article.delete
    render json: {message: "article removed"}
  end

  def update
    get_article(params[:id])
    @article.title = params[:title] || @article.title
    @article.author_id = params[:author_id] || @article.author_id
    @article.text = params[:text] || @article.text
    @article.save
    render template: "articles/show"
  end
end
