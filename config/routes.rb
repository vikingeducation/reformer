Rails.application.routes.draw do

	resources :users, :only => [:new, :create]

	get '/users' => "users#show"

end

