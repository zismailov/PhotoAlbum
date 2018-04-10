Rails.application.routes.draw do
  resources :albums, except: %i[show] do
    resources :photos, except: %i[new show], shallow: true
  end

  devise_for :users

  root "pages#index"
end
