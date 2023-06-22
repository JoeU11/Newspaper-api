class FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    favorite_articles = current_user.articles
    render json: favorite_articles # Currently bypasses paywall
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:id])
    favorite.destroy
    render json: {message: "Favorite removed"}
  end

  def create
    p "*********"
    p params
    p "*********"


    favorite = Favorite.new(user_id: current_user.id, article_id: params[:id])
    if favorite.save
      render json: {message: "Favorite saved"}
    else
      render json: {errors: favorite.errors.full_messages}, status: :bad_request
    end
  end
end
