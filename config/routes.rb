Rails.application.routes.draw do

 resources :users, only: [:new, :create]
 resources :sessions, only: [:new, :create, :destroy]
resources :products do
	resources :reviews, only: [:show, :create, :destroy]
end

end
