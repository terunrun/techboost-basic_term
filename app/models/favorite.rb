# unit22 新規作成
class Favorite < ApplicationRecord

  # unit21 一つのUserモデル、一つのtopicモデルに紐づく
  belongs_to :user
  belongs_to :topic

end
