class StoriesController < ApplicationController
  before_action :require_login

  def index
    @stories = current_user.stories.order(updated_at: :desc)
  end

  private

  def require_login
    unless logged_in?
      redirect_to root_path, alert: "ログインしてください"
    end
  end
end
