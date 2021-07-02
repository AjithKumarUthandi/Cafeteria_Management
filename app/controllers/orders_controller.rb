class OrdersController < ApplicationController
  def create
    new_order = Order.new(
      user_id: @current_user.id,
      address_id: params[:address],
      created_at: DateTime.now()
    )

    if(new_order.save)
      redirect_to order_items_path(order_id: new_order.id)
    else
      flash[:error] = new_order.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end
end
