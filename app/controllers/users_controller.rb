class UsersController < ApplicationController
  def new
<<<<<<< HEAD
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_url
  	else
  		render :new
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  	end
=======
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url,:notice => "You have been registered successfully.You can now log in."
    else
      flash[:error]=@user.errors.full_messages
      redirect_to :back
    end
  end

>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
end