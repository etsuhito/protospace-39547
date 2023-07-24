
Rails.application.routes.draw do
  devise_for :users
  get 'prototypes#index', to: 'prototypes#index'
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create 
  end
  root to: "prototypes#index"
  resources :users, only: :show
end