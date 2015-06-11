Rails.application.routes.draw do
  root 'user#new'
  resources :user, only: [:new, :create]
  get '/user' => 'user#new'
end
