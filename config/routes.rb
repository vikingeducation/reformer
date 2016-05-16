Rails.application.routes.draw do
  root 'user#index'
  resources :user, only: [:index, :edit, :update, :new, :create]
  get '/user' => 'user#new'
end
