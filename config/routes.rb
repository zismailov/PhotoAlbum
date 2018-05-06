require "sidekiq/web"

Rails.application.routes.draw do
  # main routes
  resources :albums
  resources :photos

  devise_for :users

  authenticate :user, ->(user) { user.administrator? } do
    mount Sidekiq::Web => "/monitoring"
  end

  get "/:user_name", to: "users#albums", as: :user_albums

  # root_path should be different for guests and authenticated users
  authenticated :user do
    root "albums#index", as: :authenticated_root
  end

  root "pages#welcome"
end
