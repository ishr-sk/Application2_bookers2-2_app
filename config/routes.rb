Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  
  resources :books
   
  devise_for :users
 
  

end
