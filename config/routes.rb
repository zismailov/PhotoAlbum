require "sidekiq/web"

Rails.application.routes.draw do
  authenticated :user do
    root "albums#index", as: :authenticated_root
  end

  resources :albums, except: %i[show] do
    resources :photos, except: %i[new], shallow: true
  end

  devise_for :users

  authenticate :user, ->(user) { user.administrator? } do
    mount Sidekiq::Web => "/monitoring"
  end

  get "/:user_name", to: "users#albums", as: :user_albums

  root "pages#index"
end
