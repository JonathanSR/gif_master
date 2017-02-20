class GifsController < ApplicationController
before_action :authorize!, only:[:new, :create, :destroy]
  #  def index
  #   @gifs = Gif.all
  # end
  
  def new
     @gif = Gif.new
  end
  

  # def create
  #   @gif = Gif.new(gif_params)
  #   if @gif.save
  #     flash[:notice] = "New Gif Created"
  #     redirect_to category_path(@gif.category)
      
  #   else
  #     flash.now[:notice] = "Failed to create Gif, Try Again"
  #     render :new
  #   end
  # end

  def create
    category = Category.find_or_create_by(title: params[:search])

    query = params[:search]
    connection = Faraday.new(url: "http://api.giphy.com")
    response = connection.get("v1/gifs/search?q=#{query}&api_key=dc6zaTOxFJmzC")
    body = response.body
    parsed = JSON.parse(body, :symbolize_names => true)
    img_url = parsed[:data].sample[:images][:original].fetch(:url)

    @gif = category.gifs.create(image_path: img_url)
    redirect_to category_path(@gif.category)
  end


private
  def gif_params
    params.require(:gif).permit(:category_id)
  end
end