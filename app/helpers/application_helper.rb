# unit20 viewで使用する共通のコードを記載
module ApplicationHelper
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
