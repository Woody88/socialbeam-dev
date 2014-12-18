class SessionsController < ApplicationController
  def new
  	@user = User.authenticate(params[:email], params[:password])
  	if @user
  		session[:user_id] = @user.id
  		redirect_to root_url
  	else
  		session[:user_id] = nil
  		render :new
  		flash[:notice] = "Wrong email or password combination"
    end
  end


  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
    flash[:notice] = "Wrong email or password combination"
  end

end
