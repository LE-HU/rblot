Rails.application.routes.draw do
  resources :elements
  root to: 'home#index'
  devise_for :authors
  scope module: 'authors' do
    resources :posts
  end
end
