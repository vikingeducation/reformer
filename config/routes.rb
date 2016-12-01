Rails.application.routes.draw do

  root to: 'user#new'
  resources :user, :only => [:new, :create]

end
