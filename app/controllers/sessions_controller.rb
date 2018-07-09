# unit20 新規作成
class SessionsController < ApplicationController
  def new
  end

  # unit20 新規作成
  def create
    # unit20 フォームから送信されたparamsからemailを取り出し、
    # userモデルの対応するカラムにセットしてuserモデルを検索
    user = User.find_by( email: params[:session][:email] )
    if user && user.authenticate( params[:session][:password] )
      # unit20 userが存在し、かつ
      # unit20 フォームから送信されたparamsのpasswordがDBのpasswordと一致する場合
      log_in user
      redirect_to root_path, success: "ログインに成功しました"
    else
      # unit20 userが存在しない、または、
      # unit20 フォームから送信されたparamsのpasswordがDBのpasswordと一致しない場合
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  # unit20 新規作成
  def destroy
    log_out
    redirect_to root_path, success: "ログアウトしました"
  end


  private

  # unit20 新規作成
  def log_in(user)
    # unit20 sessionのuser_idにuserのidを設定
    session[:user_id] = user.id
  end

  # unit20 新規作成
  def log_out
    # unit20 sessionを削除
    session.delete(:user_id)
    # unit20 ログイン中ユーザーを削除
    @current_user = nil
  end

end
