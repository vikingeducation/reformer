Rails.application.routes.draw do
  resources :users, except: [:destroy]

  namespace :admin do
    get 'portal', to: 'portal#index'
    get 'addresses', to: 'addresses#all'
    resources :categories
    resources :products

    resources :users do
      resources :addresses
      resources :orders do
        patch 'add_products', to: 'orders#add_products'
        patch 'update_contents', to: 'orders#update_contents'
        delete 'update_contents', to: 'orders#delete_content'
      end
      resources :cards, only: [:destroy]
    end
  end
end
