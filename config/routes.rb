Rails.application.routes.draw do
  root to: 'homes#top'
  get "/home/about" => "homes#about"
  devise_for :users
  
  resources :books, only: [:new, :show, :create, :index, :edit, :update, :destroy] do
  end
  resources :users, only: [:index, :show, :edit, :update]
end
