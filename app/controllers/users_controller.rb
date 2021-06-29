class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: %i[ new create ]


  def new
    render "users/new"
  end

  #Add a new user
  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      password: params[:password],
    )

    if (new_user.save)
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def profile
  end

  # def edit
  # end

  def update
    if( @current_user.update(user_params) )
      redirect_to "/profile"
    else
      flash[:error] = @current_user.errors.full_messages.join(", ")
      redirect_to "/profile"
    end
  end

  def destroy
    user = User.find(params[:id])
    if user && user.authenticate(params[:password])
      if(@current_user.role == user.role)
        session[:current_user_id] = nil
        @current_user = nil
      end
      user.destroy
    else
      flash[:error] = "Password is wrong"
    end
    redirect_to "/profile"
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
    end
end
