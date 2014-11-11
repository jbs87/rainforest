Rails.application.routes.draw do

	resources :users, only: [:new, :create]
	resources :sessions, only: [:new, :create, :destroy]
	resources :products do
		collection do
			get 'categories/:category' => 'products#showcategory', as: 'category'
		end
		resources :reviews, only: [:show, :create, :destroy]
	end
	get '/users/:id' => 'users#show', as: 'userprofile'

end