Rails.application.routes.draw do
  	devise_for :users
	resources :albums do
		collection { post :searchByTag}
		resources :photos 
	end
	root 'home#index'
end
