class Admin::StoriesController < Admin::BaseController
  def index
    @stories = Story.all.order(updated_at: :desc)
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy!
    redirect_to admin_stories_path, notice: "ストーリー「#{story.title}」を削除しました。", status: :see_other
  end
end
