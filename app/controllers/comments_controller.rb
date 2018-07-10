# unit22 確認テスト 新規作成
class CommentsController < ApplicationController

  def new
    # unit22 確認テスト commentインタスタンスを作成
    @comment = Comment.new
    # unit22 確認テスト 画面表示するためコメント対象のtopicインスタンスを作作成
    @topic = Topic.find(params[:topic_id])
  end

  def create
    # unit22 確認テスト ストロングパラメータを使用しないとcommentがハッシュ形式で送信されるための暫定処置★
    @comment = current_user.comments.new(comment_params)
    # unit22 確認テスト ストロングパラメータでhiddenパラメータを送信できなかったための暫定処置★
    @comment.topic_id = params[:topic_id]
    # @comment = Comment.new
    # @comment.user_id = current_user.id
    # @comment.topic_id = params[:topic_id]
    # @comment.comment = params[:comment]
    # binding.pry

    if @comment.save
      redirect_to topics_path, success: "コメントを投稿しました"
    else
      render :new, danger: "コメントの投稿に失敗しました"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:comment, :topic_id)
  end

end
