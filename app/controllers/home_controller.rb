class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    current_user
    if(@current_user && @current_user.role=="admin")
      render "admins/menu"
    else
      render "index"
    end
  end
end
