Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books, only: [:new, :create, :index, :show]
  root to: 'home#index'
end
