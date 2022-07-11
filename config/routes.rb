Rails.application.routes.draw do
  
  get '/menu' => 'items#menu'

  get '/about' => 'orders#about'

  devise_for :users
  root to: 'orders#home'
  resources :orders do
    resources :items
  end
end
