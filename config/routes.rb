Rails.application.routes.draw do
  resources :users, only: [:create, :new, :edit]
  root 'users#new'
end
