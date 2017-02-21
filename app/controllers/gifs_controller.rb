class GifsController < ApplicationController
before_action :authorize!, only:[:new, :create, :destroy]

  def new
     @gif = Gif.new
  end
  
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