class StoriesController < ApplicationController
  before_action :require_login
  before_action :set_story, only: [ :show, :set_status ]

  def index
    @stories = current_user.stories.order(updated_at: :desc)
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      redirect_to story_path(@story), notice: "ストーリーが作成されました！"
    else
      flash.now[:alert] = "ストーリーの作成に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def set_status
    if @story.update(status: params[:status])
      redirect_to story_path(@story), notice: "ステータスを'#{t("activerecord.attributes.story.statuses.#{@story.status}")}'に変更しました。"
    else
      redirect_to story_path(@story), alert: "ステータスの変更に失敗しました。"
    end
  end


  private

  def require_login
    unless logged_in?
      redirect_to root_path, alert: "ログインしてください"
    end
  end

  def set_story
    @story = current_user.stories.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :genre, :thema, :synopsis, :status)
  end
end
