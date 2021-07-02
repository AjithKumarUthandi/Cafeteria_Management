class CartItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    current_user
  end

  def create
    item = MenuItem.find(params[:item_id])
    new_cart=CartItem.new(
      menu_item_id: item.id,
      menu_item_name: item.item_name,
      user_id: current_user.id
    )
    if(new_cart.save)
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def update
    item_id = params[:id]
    qty = params[:quantity]
    if CartItem.exists?(item_id)
      item = CartItem.find(item_id)
      if qty.to_i>0
        item.menu_item_quantity = qty
        item.save!
      else
        item.destroy
      end
    end
    redirect_to "/"
  end

  def destroy_all
    current_user.cart_items.destroy_all
    redirect_to "/"
  end

  def deleteordered_all
    current_user.cart_items.destroy_all
    redirect_to "/"
  end
end
