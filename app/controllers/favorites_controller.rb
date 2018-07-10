# unit22 新規作成
class FavoritesController < ApplicationController

  def index
    # unit22 現在ログインしているユーザーがいいねしている投稿をすべて取得
    # unit22 お気に入りに登録している投稿のみを持つインスタンス変数
    @favorite_topics = current_user.favorite_topics
  end

  # unit22 追加
  def create
    # unit22 ここでインスタンス変数にしないのはview側で使用することがないから？★
    favorite = Favorite.new
    favorite.user_id = current_user.id
    # unit22 画面より送られたtopic_idをfavoriteのtopic_idにセット
    favorite.topic_id = params[:topic_id]

    # unit22 いいね結果によってメッセージを出しわけて、投稿一覧へ遷移
    if favorite.save
      redirect_to topics_path, success: "お気に入りに登録しました"
    else
      redirect_to topics_path, danger: "お気に入りに登録に失敗しました"
    end

  end

end
