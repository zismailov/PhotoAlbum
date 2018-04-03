Rails.application.routes.draw do
  resources :albums, except: [:show] do
    resources :photos, except: [:show], shallow: true
  end

  devise_for :users

  root "pages#index"
end
