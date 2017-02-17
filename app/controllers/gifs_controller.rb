class GifsController < ApplicationController

   def index
    @gifs = Gif.all
  end
  
  def new
     #@category = Category.find(params[:category_id])
     #byebug
     @gif = Gif.new
  end
  

  def create
    #@category = Category.find(params[:category_id])
    @gif = Gif.new(gif_params)
    if @gif.save
      flash[:notice] = "New Gif Created"
      redirect_to category_path(@gif.category)
      
    else
      flash.now[:notice] = "Failed to create Gif, Try Again"
      render :new
    end
  end



private
  def gif_params
    params.require(:gif).permit(:image_path, :category_id)
  end

end