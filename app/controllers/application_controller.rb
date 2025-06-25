class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  add_flash_types :success, :info, :warning, :error

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
