Rails.application.routes.draw do
  resources :users, only: [:index, :show, :edit, :new, :create, :update]
end
