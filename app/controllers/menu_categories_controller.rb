class MenuCategoriesController < ApplicationController
  def index
    render "index"
  end
  def create
    menu_name = params[:menu_name]
    available_time_begin = params[:available_time_begin]
    available_time_end = params[:available_time_end]
    active = params[:active]

    new_menu_catagory = MenuCategory.new(
      menu_name: menu_name
      available_time_begin: available_time_begin
      available_time_end: available_time_end
      active: true
    )

    if(new_menu_catagory.save)
      redirect_to "/"
    end
  end

  def active_update
    id = params[:id]
    active = params[:active]
    menu = current_user.todos.find(id)
    menu.active = active
    menu.save!
    # redirect_to todos_path
  end

end
