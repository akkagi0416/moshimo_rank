Rails.application.routes.draw do

  root "top#index"
  get 'rankings/:category', to: 'top#index', as: 'rankings'
  resources :articles, only: [:show]
end
