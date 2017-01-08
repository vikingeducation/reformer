Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  root to: 'users#new'

  resources :users, :only => [:new, :create, :index, :show, :edit, :update]
end
