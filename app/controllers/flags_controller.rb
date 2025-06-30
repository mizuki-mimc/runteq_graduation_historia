class FlagsController < ApplicationController
  before_action :require_login
  before_action :set_story
  before_action :set_flag, only: [ :show, :edit, :update, :destroy ]

  def index
    @flags = @story.flags.includes(:plot_flags).order(:created_at)
  end

  def show
  end

  def new
    @flag = @story.flags.build
  end

  def create
    @flag = @story.flags.build(flag_params)
    if @flag.save
      redirect_to story_flags_path(@story), success: "フラグを作成しました。"
    else
      flash.now[:error] = "フラグの作成に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flag.update(flag_params)
      redirect_to story_flag_path(@story, @flag), success: "フラグを更新しました。"
    else
      flash.now[:error] = "フラグの更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flag.destroy
    redirect_to story_flags_path(@story), success: "フラグを削除しました。", status: :see_other
  end

  private

  def set_story
    @story = current_user.stories.find(params[:story_id])
  end

  def set_flag
    @flag = @story.flags.includes(plot_flags: :plot).find_by(id: params[:id])
    unless @flag
      flash[:error] = "フラグは存在しません。"
      redirect_to story_flags_path(@story)
    end
  end

  def flag_params
    params.require(:flag).permit(:title, :content)
  end
end
