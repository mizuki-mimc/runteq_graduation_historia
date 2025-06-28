class PlotsController < ApplicationController
  before_action :require_login
  before_action :set_story
  before_action :set_plot, only: [ :edit, :update, :destroy ]

  def new
    @plot = @story.plots.build
    @world_guides = @story.world_guides.order(:created_at)
    @characters = @story.characters.order(:created_at)
  end

  def create
    @plot = @story.plots.build(plot_params)
    if @plot.save
      redirect_to story_path(@story), success: "プロットを追加しました。"
    else
      @world_guides = @story.world_guides.order(:created_at)
      @characters = @story.characters.order(:created_at)
      flash.now[:error] = "プロットの作成に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @world_guides = @story.world_guides.order(:created_at)
    @characters = @story.characters.order(:created_at)
  end

  def update
    if @plot.update(plot_params)
      redirect_to story_path(@story), success: "プロットを更新しました。"
    else
      @world_guides = @story.world_guides.order(:created_at)
      @characters = @story.characters.order(:created_at)
      flash.now[:error] = "プロットの更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plot.destroy
    redirect_to story_path(@story), success: "プロットを削除しました。", status: :see_other
  end

  private

  def set_story
    @story = current_user.stories.find(params[:story_id])
  end

  def set_plot
    @plot = @story.plots.find(params[:id])
  end

  def plot_params
    params.require(:plot).permit(:chapter, :title, :summary, :content, :order, world_guide_ids: [], character_ids: [])
  end
end
