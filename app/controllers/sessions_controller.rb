class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in, :ensure_admin_role, :ensure_customer_role
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
     else
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to new_sessions_path
    end
  end

  def destroy
    role=current_user.role=="admin"
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to (role)? new_sessions_path :  "/"
  end
end
