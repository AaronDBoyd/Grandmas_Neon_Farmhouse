Rails.application.routes.draw do
  
  devise_for :users
  root to: 'orders#home'
  resources :orders do
    resources :items
  end
end
