class OrdersController < ApplicationController
  skip_before_action :ensure_customer_role,only: [:create]
  skip_before_action :ensure_admin_role,except: [:create]
  def create
    if(@current_user.role=="clerk")
      new_order = Order.new(
        user_id: @current_user.id,
        created_at: DateTime.now()
        delivered_at: DateTime.now()
      )
    else
      new_order = Order.new(
        user_id: @current_user.id,
        address_id: params[:address],
        created_at: DateTime.now()
      )
    end

    if(new_order.save)
      redirect_to order_items_path(order_id: new_order.id)
    else
      flash[:error] = new_order.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def complete_order
    order = Order.find(params[:id])
    order.delivered_at = DateTime.now()
    order.save!
    redirect_back(fallback_location: "/")
  end

  def cancel_order
    order=Order.find(params[:order_id])
    order.ordercancel_at = DateTime.now()
    order.cancel_reason = params[:reason]
    unless order.save
      flash[:error]=order.errors.full_messages.join(",")
    end
    redirect_back(fallback_location:"/")
  end

end
