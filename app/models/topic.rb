# unit21 新規作成
class Topic < ApplicationRecord

  # unit21 精査を追加
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  # unit21 一つのUserモデルに紐づく
  belongs_to :user

  # unit21 複数のFavoriteモデルを持つ
  has_many :favorites
  # unit22 favoriteを通してuserを取得しfavorite_usersとする
  has_many :favorite_users, through: :favorites, source: "user"

  # unit21 carrierwave用設定　画像をアップロードするModelに追記する★
  mount_uploader :image, ImageUploader

  # unit22 確認テスト 複数のcommentモデルを持つ
  has_many :comments

end
