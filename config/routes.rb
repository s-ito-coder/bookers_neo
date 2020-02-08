Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :post_images, only: [:new, :create, :index, :show]
  root to: 'home#index'
  get "home/about" => "home#about"
  post "books/:id/destroy" => "books#destroy"
  post "books/:id/edit" => "books#edit"
end
