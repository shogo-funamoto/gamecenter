Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:show, :create, :edit, :update]
  resources :games, only: [:new, :index, :show, :destroy]
  resources :comments, only: [:new, :create, :destroy, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
