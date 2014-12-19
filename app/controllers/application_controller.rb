class ApplicationController < ActionController::Base
<<<<<<< HEAD
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   include ApplicationHelper 
=======
  protect_from_forgery
  include ApplicationHelper
  helper :all
  helper_method :current_user_session, :current_user, :require_user

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to signin_path
      return false
    end
  end

  def get_user
    @user ||= User.find_by_beamer_id(params[:id])
    render(:template => "errors/error_404", :status => 404) if @user.blank?
  end

>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
end
