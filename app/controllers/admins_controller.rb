class AdminsController < ApplicationController
  skip_before_action :ensure_admin_role
  def menu
  end

  def menu_item
    @category = MenuCategory.find(params[:category_id])
    @items = MenuItem.getall_items(@category.id)
  end

  def order
  end
end
