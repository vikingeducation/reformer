Rails.application.routes.draw do
  resources :users, only: [:create, :new, :edit, :show, :update]
  root 'users#new'
end
