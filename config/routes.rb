Rails.application.routes.draw do
  devise_for :users

  root to: 'static_pages#home'
  get 'help', to: 'static_pages#help'

  resources :cars, only: :index
  resources :searches, only: %i[index new create]
end
