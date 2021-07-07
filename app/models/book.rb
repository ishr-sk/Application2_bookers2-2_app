class Book < ApplicationRecord
  belongs_to :user, optional: true

  # ==============いいね機能==============
  has_many :favorites, dependent: :destroy
    # 引数で渡されたユーザidがfavoritesテーブル内に存在(xists?)するかどうかを調べる。
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  # ===============ここまで===============


  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
