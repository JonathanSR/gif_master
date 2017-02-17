class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      flash[:notice] = "Logged In"
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "Try Again"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "logout"
    redirect_to login_path
  end
end

