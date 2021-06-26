class MenuItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    current_user
    menu_category_id = params[:menu_id]
    @items = MenuItem.get_items(menu_category_id)
    render "index"
  end
end
