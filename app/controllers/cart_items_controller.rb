class CartController < ApplicationController
  def create
    item_id = params[:item_id]
    new_cart=CartItem.new(
      menu_item_id: item_id
      menu_item_name: item_id.menu_item_name
      user_id: @current_user.id
    )
    if(new_cart.save)
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def update
    item_id = params[:item_id]
    qty = params[:quantity]
    item = current_user.cart_items.find(item_id)
    if qty==0
      item.menu_item_quantity = qty
      item.save!
    else
      item.destroy
    end
    redirect_to "/"
  end

  def destroy
    items=current_user.cart_items.all
    items.destroy
    redirect_to "/"
  end
end
