class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
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
end
