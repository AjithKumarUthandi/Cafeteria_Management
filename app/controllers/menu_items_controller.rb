class MenuItemsController < ApplicationController
  def index
    menu_category_id = params[:menu_id]
    @items = MenuItem.get_items(menu_category_id)
    render "index"
  end


end
