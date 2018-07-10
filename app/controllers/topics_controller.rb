# unit21 新規作成
class TopicsController < ApplicationController

  def new
    # unit21 topicインスタンスを作成
    @topic = Topic.new
  end

  # unit21 追加
  def create
    # unit21 ログイン中のユーザーに紐づくtopicインスタンスを作成
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      # unit21 DBへの保存に成功した場合
      redirect_to root_path, success: "投稿に成功しました"
    else
      # unit21 DBへの保存に成功しなかった場合
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  # unit21 追加
  def index
    # unit21 すべてのpostを取得
    # unit22 view側でeachの回数分、全ユーザーからお気に入り登録しているユーザーを探す子になるため、
    #n unit22 includeメソッドを使用するように修正
    # @topics = Topic.all
    @topics = Topic.all.includes(:favorite_users)
  end

  private

  # unit21 追加
  def topic_params
    # unit21 リクエストパラメータとして送信を許可する項目を制限
    params.require(:topic).permit(:description, :image)
  end

end
