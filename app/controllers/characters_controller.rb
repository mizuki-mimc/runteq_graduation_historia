class CharactersController < ApplicationController
  before_action :require_login
  before_action :set_story

  def index
    @characters = @story.characters.order(:created_at)
    @grouped_characters = @characters.group_by(&:category)
    @categories = Character.categories.keys
  end

  private

  def set_story
    @story = current_user.stories.find(params[:story_id])
  end

  # def character_params
  #   params.require(:character).permit(:name, :race, :gender, :age, :category)
  # end
end
