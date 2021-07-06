class AdminsController < ApplicationController
  def menu
  end

  def menu_item
    @category = MenuCategory.find(params[:category_id])
    @items = MenuItem.getall_items(@category.id)
  end

  def order
  end
end
