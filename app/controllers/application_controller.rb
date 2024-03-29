class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :current_user_session, :logged_in?, :admin?

  private

  def logged_in?
    !!current_user
  end

  def admin?
    current_user && current_user.admin?
  end

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= (current_user_session && current_user_session.user)
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_path
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_path
      return false
    end
  end

  def require_admin
    require_user unless current_user
    unless admin?
      store_location
      flash[:notice] = "unauthorized access attempted"
      redirect_to root_path
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
