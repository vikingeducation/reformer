Rails.application.routes.draw do
  resources :user , only: [:new, :create]
  root to: 'user#new'
end
