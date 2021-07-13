class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in, :ensure_admin_role, :ensure_customer_role, :ensure_clerk_role

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def ensure_admin_role
    if current_user.role == "admin"
      error
    end
  end

  def ensure_clerk_role
    if current_user.role == "clerk"
      error
    end
  end

  def ensure_customer_role
    if current_user.role == "customer"
      error
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id
      begin
        @current_user = User.find(current_user_id)
      rescue
        session[:current_user_id]=nil
        @current_user = nil
        redirect_to "/"
      end
    else
      nil
    end
  end

  def error
    render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  end
end
