class Admin::UsersController < Admin::BaseController
#before_action :authorize!, only: [:index]
  def index
    @users = User.all
  end
end