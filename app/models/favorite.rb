class Favorite < ApplicationRecord
    # アソシエーションの定義
    belongs_to :user
    belongs_to :book
    # １人が１つの投稿に対して、１つしかいいねがつけられないようにする
    validates_uniqueness_of :book_id, scope: :user_id
end

