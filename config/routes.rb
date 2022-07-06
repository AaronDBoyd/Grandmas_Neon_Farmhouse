Rails.application.routes.draw do
  
  get '/menu' => 'items#menu'

  devise_for :users
  root to: 'orders#home'
  resources :orders do
    resources :items
  end
end
