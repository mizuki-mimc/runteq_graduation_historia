class Admin::DashboardController < Admin::BaseController
  def index
    @user_count = User.count
    @story_count = Story.count
    @users_this_week = User.where("created_at >= ?", 1.week.ago).count
    @stories_this_week = Story.where("created_at >= ?", 1.week.ago).count
    @recent_users = User.where("created_at >= ?", 1.week.ago).order(created_at: :desc)
  end
end
