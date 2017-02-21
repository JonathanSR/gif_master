class CategoriesController < ApplicationController
 before_action :authorize!, only: [:new, :create, :destroy]
before_action :user!, only: [:index, :show]

 def new
   @category = Category.new
   #byebug
  end
   

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "New Category Added"
      redirect_to category_path(@category)  
    else
      flash.now[:notice] = "Failed to Add Category, Try Again"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end 