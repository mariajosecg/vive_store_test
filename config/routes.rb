Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'frontend/products#index'

  namespace :api do
    namespace :v1 do
      resources :products, only: :create
    end
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  resources :products, only: %i[index show], module: 'frontend'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
