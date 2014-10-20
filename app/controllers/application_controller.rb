class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception| 
    redirect_to root_path, alert: "You can't access this page" 
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # if @current is nil, it will apply the bit on the right
    # if @current already has something, it keeps what it is. i.e the bit at the top only runs when there isnt a current user
    # if we dont do this, it will run sql each time, as opposed to now when we can just  use the instance variable
  end

  def require_login
    unless !!current_user
      flash[:alert] = "You can't access this route!"
      redirect_to root_path
    end
  end

end
