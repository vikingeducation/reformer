Rails.application.routes.draw do

  root to: 'user#new'
  resources :user
end
