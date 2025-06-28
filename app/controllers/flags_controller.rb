class FlagsController < ApplicationController
  before_action :require_login
  before_action :set_story

  def index
    @flags = @story.flags.order(:created_at)
  end

  private

  def set_story
    @story = current_user.stories.find(params[:story_id])
  end
end
