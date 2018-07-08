# unit18 新規作成
class User < ApplicationRecord

  # unit19 name、emailに必須精査を追加
  validates :name, presence: true
  validates :email, presence: true

  # unit19 セキュアなパスワードを扱えるようにする
  # password、password_comfirmationが使え、その二つが一致しているかの精査も利用可能
  # authenticateメソッドが使用できる
  has_secure_password

end
