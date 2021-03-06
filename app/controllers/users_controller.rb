class UsersController < ApplicationController
  before_action :user!, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for registering"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Registration failed, try again"
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end