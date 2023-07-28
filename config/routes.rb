Rails.application.routes.draw do
  devise_for :users
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
   resources :comments, only: :create
  end
  root to: "prototypes#index"
  resources :users, only: [:show, :new]
  # resources :users, only: [:show, :new]
end