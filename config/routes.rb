Rails.application.routes.draw do
  resources :users, :only => [:create, :new, :index, :edit, :update]
end
