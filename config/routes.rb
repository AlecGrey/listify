Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # resources :ingredients
  resources :grocery_lists
  resources :foods
  resources :recipes
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  
  # ~~ list_recipes routes ~~ #
  resources :list_recipes, only: :create
  delete '/list_recipe', to: 'list_recipes#destroy', as: 'remove_recipe'


  # ~~ welcome routes ~~ #
  root 'welcome#home'
  get '/about', to: 'welcome#about'

  # ~~ application routes ~~ #
  post '/clear', to: 'application#clear', as: 'clear_cookies'

  # ~~ sessions routes ~~ #
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  # ~~ users routes ~~ #
  get '/sign_up', to: 'users#new'

end
