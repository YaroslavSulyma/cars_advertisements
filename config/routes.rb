Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'homes#index'
  resources :cars, only: :index
  resources :searches, only: %i[index new create]
  resources :helps, only: :index
end
