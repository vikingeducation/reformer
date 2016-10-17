Rails.application.routes.draw do
  resources :users , only: [:new, :create, :show, :index]
  root to: 'user#new'
end
