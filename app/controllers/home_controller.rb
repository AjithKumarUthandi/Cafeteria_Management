class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    current_user
    render "index"
  end
end
