Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  root 'users#new'

  resources :users, only: [:new, :create]
end
