
Rails.application.routes.draw do
  get 'prototypes/index'
  get 'messages/index'
  root to: "prototypes#index"
end