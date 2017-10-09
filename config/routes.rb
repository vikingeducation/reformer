Rails.application.routes.draw do
  resources :users, except: [:destroy]
  get '/admin', to: 'admin_portal#index'
end
