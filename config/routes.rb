Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    root to: 'static_pages#home'
    get 'help', to: 'static_pages#help'

    resources :cars, only: :index
    resources :searches, only: %i[index new create]
  end
end
