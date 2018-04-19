require "sidekiq/web"

Rails.application.routes.draw do
  # Sidekiq web interface
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => "/monitoring"
  end

  resources :albums, except: %i[show] do
    resources :photos, except: %i[new], shallow: true
  end

  devise_for :users

  root "pages#index"
end
