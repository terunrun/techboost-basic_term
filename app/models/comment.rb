# unit22 確認テスト　新規作成
class Comment < ApplicationRecord

  # 一つのUserモデル、一つのtopicモデルに紐づく
  belongs_to :user
  belongs_to :topic

  # コメントが空の場合エラーを起こす
  validates :comment, presence: true

end
