Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :authors
  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
end
