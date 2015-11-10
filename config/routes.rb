Rails.application.routes.draw do
  # resources :rankings, only: [:show]

  root "top#index"
  get 'rankings/:category', to: 'top#index'
end
