class AddressesController < ApplicationController
  def new
  end

  def create
    new_address= Address.new(
      door_no: params[:door_no],
      address: params[:address],
      city: params[:city],
      postal_code: params[:pin_code],
      state: params[:state],
      country: "India",
      user_id: @current_user.id
    )
    if(new_address.save)
      redirect_to '/'
    else
      flash[:error] = new_address.errors.full_messages.join(", ")
      redirect_to new_address_path
    end
  end
end
