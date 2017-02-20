class FavoritesController < ApplicationController

  def index
   @user = current_user
   @favorites = @user.favorites.all
   #byebug
  end

  def new
  end

  def create
    gif = Gif.find(params[:gif_id])
    user = session[:user_id]
    favorite = Favorite.find_or_create_by(user_id: user, gif_id: gif.id)
    flash[:notice] = "Gif Added To Favorites"
    redirect_to category_path(gif.category)
  end

  def show
  end

  def destroy
    gif = Gif.find(params[:gif_id])    
    user = session[:user_id]    
    @favorite = Favorite.find_by(user_id: user, gif_id: gif.id)
#byebug
    if @favorite  == nil
      flash[:notice] = "Gif already Removed"
    else
    @favorite.destroy
    flash[:notice] = "Gif Removed from Favorites"
    end
    redirect_to category_path(gif.category)
  end
end