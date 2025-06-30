class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "管理者権限がありません。"
    end
  end
end
