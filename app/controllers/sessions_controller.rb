class SessionsController < ApplicationController
  def omniauth
    auth = request.env["omniauth.auth"]

    user = User.find_or_initialize_by(provider: auth["provider"], uid: auth["uid"])
    user.email = auth["info"]["email"]
    user.name = auth["info"]["name"]
    user.save!

    session[:user_id] = user.id

    redirect_to root_path, notice: "ログインしました。ようこそ、#{user.name}さん！"
  rescue => e
    logger.error "OAuth認証エラー: #{e.message}"
    redirect_to root_path, alert: "ログインに失敗しました。"
  end

  def auth_failure
    message = params[:message] || "認証に失敗しました。"
    logger.error "OmniAuth Authentication Failure: #{message}"
    redirect_to root_path, alert: "Googleログインに失敗しました: #{message}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
