Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :index, :show, :update, :edit]

  root "users#new"
end
