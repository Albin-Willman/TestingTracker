class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :require_user

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    return true if current_user
    flash[:error] = t('common.you_must_be_logged_in')
    redirect_to root_url
    false
  end

  def require_admin
    return true if current_user.admin
    redirect_to root_url
    false
  end
end
