Rails.application.routes.draw do

  root 'users#new'
  resources :users, only: [:new, :create, :index, :show]

end
