Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # resources :list_recipes
  # resources :grocery_lists
  # resources :ingredients
  
  resources :foods
  resources :recipes

  root 'welcome#home'
  
  get '/about', to: 'welcome#about'

end
