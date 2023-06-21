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
    p current_user
    if !@article.premium || current_user && current_user.premium_member
      render template: "articles/show"
    else
      render json: {id: @article.id,
        title: @article.title,
        author: @article.author_name,
        photos: @article.photos,
        premium: @article.premium,
        created_at: @article.created_at,
        updated_at: @article.updated_at}
    end
  end

  def create
    if current_user.admin
      @article = Article.new(title: params[:title], author_id: params[:author_id], text: params[:text])
      if @article.save
        render template: "articles/show"
      else
        render json: {error: "Article could not be saved"}
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user.admin
      get_article(params[:id])
      @article.delete
      render json: {message: "article removed"}
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    if current_user.admin
      get_article(params[:id])
      @article.title = params[:title] || @article.title
      @article.author_id = params[:author_id] || @article.author_id
      @article.text = params[:text] || @article.text
      if @article.save
        render template: "articles/show"
      else
        render json: {errors: article.errors.full_messages}, status: :bad_request
      end
    else
      render json: {}, status: :unauthorized
    end
  end
end
