class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  layout :set_layout

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def set_layout
    if controller_name == "home" && action_name == "index" && !logged_in?
      "before_login"
    elsif logged_in?
      "after_login"
    else
      "before_login"
    end
  end
end
