class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  before_filter :check_concurrent_session

  def check_concurrent_session
    if is_already_logged_in?
      sign_out_and_redirect(current_user)
    end
  end

  def is_already_logged_in?
    current_user && !(session[:token] == current_user.login_token)
  end
end