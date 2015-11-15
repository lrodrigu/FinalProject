Rails.application.routes.draw do
	resources :students
 	resources :projects

 	get '/search', to: 'projects#index'
  
  root 'home#show'
end
