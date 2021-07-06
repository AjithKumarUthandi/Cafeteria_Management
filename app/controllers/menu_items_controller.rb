class MenuItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    current_user
    menu_category_id = params[:menu_id]
    @items = MenuItem.get_items(menu_category_id)
    render "/"
  end

  def create
    new_item = MenuItem.new(
      item_name: params[:item_name],
      description: params[:description],
      price: params[:price],
      active: params[:active],
      menu_category_id: params[:category_id]
    )

    if(new_item.save)
      flash[:info] = "Succefully created"
    else
      flash[:error] = new_item.errors.full_messages.join(",")
    end
    redirect_back(fallback_location: "/")
  end

  def update
    item_id = params[:id]
    if(MenuItem.find(item_id).update(item_params))
      flash[:info] = "Succefully updated"
      redirect_back(fallback_location: "/")
    else
      flash[:error] = item_id.errors.full_messages.join(",")
      redirect_back(fallback_location: "/")
    end
  end

  def active_update
    item= MenuItem.find(params[:id])
    item.active = params[:active]
    unless item.save
      flash[:error] = item.errors.full_messages.join(",")
    end
    redirect_back(fallback_location: "/")
  end

  def destroy
    item = MenuItem.find(params[:id])
    item.archive_at = Time.zone.now()
    item.save!
    redirect_back(fallback_location: "/")
  end

  private
    def item_params
      params.require(:menu_item).permit(:item_name, :price, :description)
    end
end
