Rails.application.routes.draw do
  root to: 'homes#top'
  get "/home/about" => "homes#about"
  devise_for :users
  
  resources :books, only: [:new, :show, :create, :index, :edit, :update, :destroy] do
    # booksにネストする（親子関係）→ bookにfavoriteが続くURLが生成される（books/:book_id/favorites(.:format) ）
    # 「この投稿に関連づけられた、いいね」と認識できるURLの方がユーザーにとってわかりやすい
    # resource: 単数形にするとコントローラーのidがリクエストに含まれなくなる
    # 今回いいねの詳細ページは作成しないので、idの受け渡しが不要→resourceとなる
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update]
end
