class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

helper_method :current_user
helper_method :current_admin?


  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user!
    render file: '/public/404' unless current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end
  
  def authorize!
    render file: '/public/404' unless current_user && current_admin?
  end
end
