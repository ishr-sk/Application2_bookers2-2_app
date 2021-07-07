class Favorite < ApplicationRecord
    # アソシエーションの定義
    belongs_to :user
    belongs_to :book
    validates_uniqueness_of :book_id, scope: :user_id
end

