class CharacterRelationshipsController < ApplicationController
  before_action :require_login
  before_action :set_story_and_relationship

  def show
  end

  def edit
  end

  def update
    if @character_relationship.update(character_relationship_params)
      redirect_to story_character_relationship_path(@story, @character_relationship), notice: "関係性の詳細を更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_story_and_relationship
    @story = current_user.stories.find(params[:story_id])
    @character_relationship = @story.character_relationships.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "指定された情報が見つかりません。"
  end

  def character_relationship_params
    params.require(:character_relationship).permit(:description)
  end
end
