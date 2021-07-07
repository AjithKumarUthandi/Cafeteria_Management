class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in,only: [:new, :create]
  skip_before_action :ensure_admin_role,except: [:create, :profile, :destroy]
  skip_before_action :ensure_customer_role


  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      password: params[:password],
    )

    if (User.valid_email(params[:email]) && new_user.save)
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      if(flash[:error] =="")
        flash[:error]="email name aldready exist"
      end
      redirect_to "/users/new"
    end
  end

  def profile
  end

  def update
    user = @current_user
    user_parameters = user_params
    if( User.valid_email(user_parameters["email"]) && @current_user.update( user_params) )
      flash[:info]="Succeflly update"
    else
      flash[:error] = @current_user.errors.full_messages.join(", ")
      if(@current_user.email!=user_parameters["email"] && flash[:error] =="")
        flash[:error]="email name aldready exist"
      end
    end
    if (@current_user.role=="admin")
      redirect_back(fallback_location:"/")
    else
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
      user.archive_at = Time.now()
      redirect_to "/signin"
    else
      flash[:error] = "Password is wrong"
      redirect_back(fallback_location: "/")
    end
  end

  def update_password
    user=@current_user
    if user && user.authenticate(params[:old_password])
      user.password = params[:new_password]
      if(user.save)
        flash[:info]="Password Changed"
      else
        flash[:error]= @current_user.errors.full_messages.join(", ")
      end
    else
      flash[:error]="Invalid password"
    end
    if (@current_user.role=="admin")
      redirect_back(fallback_location:"/")
    else
      redirect_back(fallback_location:"/profile")
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
    end
end
