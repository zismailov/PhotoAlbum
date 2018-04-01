Rails.application.routes.draw do
  get 'pages/index'

  devise_for :users
  get 'pages/index'
end
