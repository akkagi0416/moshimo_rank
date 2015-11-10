Rails.application.routes.draw do
  get 'articles/show'

  # resources :rankings, only: [:show]

  root "top#index"
  get 'rankings/:category', to: 'top#index', as: 'rankings'
end
