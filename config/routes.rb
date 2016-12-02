Rails.application.routes.draw do

  root to: 'user#index'
  resources :user
end
