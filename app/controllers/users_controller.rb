# unit17 新規作成
class UsersController < ApplicationController
  def new
    # unit18 インスタンス変数を作成
    @user = User.new
  end

  # unit18 user作成メソッドを追加
  def create
    # unit18 デバッグ用コードを仕込む
    # binding.pry
    # unit18 フォームから送信されたparamsからnameとemailを取り出し、
    # userモデルの対応するカラムにセットしてuserモデルをnew
    # unit19 user_paramsメソッドで記載
    # @user = User.new( name: params[:user][:name], email: params[:user][:email] )
    @user = USer.new( user_params )
    if @user.save
      # unit18 DBへの保存に成功した場合
      # unit18 ルート（ホーム画面）を表示
      # unit19 新規登録が完了したらメッセージを画面に表示する
      # flash[:success] = "登録が完了しました"
      redirect_to root_path, success: "登録が完了しました"
    else
      # unit18 DBへの保存に成功しなかった場合
      # unit18 newページを再表示
      # unit19 新規登録が失敗したらメッセージを画面に表示する
      flash.now[:danger] = "登録に失敗しました"
      render :new
      # unit18 railstutorial的には以下だが、どっちでもOKな模様。★
      # render 'new'
    end
  end

  private

    # unit19 paramsで送信を許可する項目を設定
    def user_params
      params.requier(:user).permit( :name, :email, :password, :password_confirmation )
    end

end
