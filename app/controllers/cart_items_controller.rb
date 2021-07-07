class CartItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in, :ensure_customer_role

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
    unless(new_cart.save)
      flash[:error] = new_user.errors.full_messages.join(", ")
    end
    redirect_back(fallback_location: "/")
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
    redirect_back(fallback_location: "/")
  end

  def destroy_all
    current_user.cart_items.destroy_all
    redirect_back(fallback_location: "/")
  end

  def deleteordered_all
    current_user.cart_items.destroy_all
    redirect_back(fallback_location: "/")
  end
end
