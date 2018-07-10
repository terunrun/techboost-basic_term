# unit18 新規作成
class User < ApplicationRecord

  # unit19 name、emailに必須精査を追加
  validates :name, presence: true
  validates :email, presence: true

  # unit19 セキュアなパスワードを扱えるようにする
  # password、password_comfirmationが使え、その二つが一致しているかの精査も利用可能
  # authenticateメソッドが使用できる
  has_secure_password

  # unit21 複数のTopicモデルを持つ
  has_many :topics

  # unit22 複数のFavoriteモデルを持つ
  has_many :favorites
  # unit22 favoriteモデルとの関連付けを追加
  # unit22 favoriteを通してtopicを取得しfavorite_topicsとする
  has_many :favorite_topics, through: :favorites, source: "topic"

end
