Rails.application.routes.draw do
  resources :users, except: [:destroy]

  namespace :admin do
    get 'portal', to: 'portal#index'
    get 'addresses', to: 'addresses#all'
    resources :categories
    resources :products

    resources :users do
      resources :addresses
      resources :orders
      resources :cards, only: [:destroy]
    end
  end
end
