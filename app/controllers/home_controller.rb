class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in, :ensure_customer_role, :ensure_admin_role
  def index
    current_user
    if(@current_user && @current_user.role=="admin")
      render "admins/menu"
    end
  end
end
