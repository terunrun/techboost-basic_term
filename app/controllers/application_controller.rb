class ApplicationController < ActionController::Base
  # unit19 CSRF対策
  protect_from_forgery with: :exception

  # unit19 flashメッセージのタイプを追記
  add_flash_types :success, :info, :warning, :danger

  # unit20 新規作成
  def current_user
    # unit20 現在ログインしているユーザーを返す
    # unit20 現在のユーザーがnilでないなら現在のユーザー、
    # unit20 nilならsessionのuser_idでUserモデルを検索してuserを作成
    @current_user ||= User.find_by( id: session[:user_id] )
  end

  # unit20 新規作成
  def logged_in?
    # unit20 current_userがnilの場合にtrueを返す
    !current_user.nil?
  end

end
