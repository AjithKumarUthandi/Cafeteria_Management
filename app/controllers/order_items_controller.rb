class OrderItemsController < ApplicationController
  def create
    new_orders = []
    @current_user.cart_items.each do |item|
      new_orders.push(OrderItem.new(
        order_id: params[:order_id],
        menu_item_id: item.menu_item_id,
        menu_item_name: item.menu_item_name,
        menu_item_name: MenuItem.find(item.menu_item_id).price * item.menu_item_quantity,
        menu_item_quantity: item.menu_item_quantity
      ))
    end
    ordered=true
    new_orders.map{|order|
      unless order.save
        ordered=false
        break
      end
    }
    if(ordered)
      flash[:info] = "order confirmed. Go order and check your status"
      redirect_to cart_deleteordereditems_path
    else
      flash[:error] = "your ordered failed"
      redirect_to "/"
    end
  end
end
