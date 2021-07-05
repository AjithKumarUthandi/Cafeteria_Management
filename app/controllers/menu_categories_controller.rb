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
      menu_name: menu_name,
      available_time_begin: available_time_begin,
      available_time_end: available_time_end,
      active: active
    )

    if(new_menu_catagory.save)
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def active_update
    id = params[:id]
    active = params[:active]
    menu = MenuCategory.find(id)
    menu.active = active
    menu.save!
    redirect_to "/"
  end

  def update
    category_id = params[:id]
    if( MenuCategory.find(category_id).update(category_params) )
      redirect_to "?"
    else
      flash[:error] = category_id.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def destroy
    menu = MenuCategory.find(params[:id])
    menu.archive_at = Time.zone.now()
    menu.save!
    redirect_to "/"
  end

  private
    def category_params
      params.require(:menu_category).permit(:menu_name, :available_time_begin, :available_time_end)
    end
end
