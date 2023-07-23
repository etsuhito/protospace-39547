
Rails.application.routes.draw do
  get 'prototypes/index'
  get 'messages/index'
  root to: "messages#index"
end