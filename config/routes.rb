Rails.application.routes.draw do
	resources :students
 	resources :projects

 	get '/search', to: 'projects#index'
  	post '/login', to: 'sessions#create'
  	get '/login', to: 'sessions#new'
  	delete '/logout', to: 'sessions#destroy'

  root 'home#show'
end
