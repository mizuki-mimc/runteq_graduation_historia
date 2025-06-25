class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to stories_path
    end
  end
end
