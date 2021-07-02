class OrderController < ApplicationController
  def create
    new_order = Order.new(
      user_id: @current_user.id,
      address_id: params[:address],
      created_at: DateTime.now()
    )

    if(new_user.save)
      redirect_to order_items_path method: :post
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end
end
