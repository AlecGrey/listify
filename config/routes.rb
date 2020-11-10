Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # resources :ingredients
  
  # ~~ list_recipes routes ~~ #
  resources :list_recipes, only: :create
  delete '/list_recipe', to: 'list_recipes#destroy', as: 'remove_recipe'

  resources :grocery_lists
  resources :foods
  resources :recipes

  # ~~ welcome routes ~~ #
  root 'welcome#home'
  get '/about', to: 'welcome#about'

  # ~~ application routes ~~ #

  post '/clear', to: 'application#clear', as: 'clear_cookies'

end
