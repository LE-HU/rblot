Rails.application.routes.draw do
  resources :posts
  devise_for :authors
  root to: 'home#index'
end
