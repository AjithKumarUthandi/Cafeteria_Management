class MenuCategoriesController < ApplicationController
  skip_before_action :ensure_admin_role
  def create
    menu_name = params[:menu_name]
    available_time_begin = params[:available_time_begin]
    available_time_end = params[:available_time_end]
    active = params[:active]

    new_menu_catagory = MenuCategory.new(
      menu_name: menu_name,
      available_time_begin: available_time_begin,
      available_time_end: available_time_end,
      active: active
    )

    if(new_menu_catagory.valid? and new_menu_catagory.save)
      redirect_to "/"
    else
      flash[:error] = new_menu_catagory.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def active_update
    id = params[:id]
    active = params[:active]
    menu = MenuCategory.find(id)
    menu.active = active
    menu.save!(validate: false)
    redirect_to "/"
  end

  def update
    category = MenuCategory.find(params[:id])
    category_parameters = category_params
    category.menu_name = category_parameters["menu_name"]
    category.available_time_begin = category_parameters["available_time_begin"]
    category.available_time_end = category_parameters["available_time_end"]
    if( category.valid? && category.save )
      redirect_to "/"
    else
      flash[:error] = "Item name already exist"
      redirect_to "/"
    end
  end

  def destroy
    menu = MenuCategory.find(params[:id])
    menu.archive_at = Time.now()
    menu.save!(validate: false)
    MenuItem.getall_items(menu.id).each do |item|
      item.archive_at = Time.now()
      item.save!(validate: false)
    end
    redirect_to "/"
  end

  private
    def category_params
      params.require(:menu_category).permit(:menu_name, :available_time_begin, :available_time_end)
    end
end
