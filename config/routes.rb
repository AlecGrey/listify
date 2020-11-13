Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :recipes, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  # ~~ routes for users and nested grocery_lists ~~ #
  resources :users, only: [:show, :new, :create] do
    resources :grocery_lists, shallow: true
  end
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  # ~~ list_recipes routes ~~ #
  resources :list_recipes, only: :create
  delete '/list_recipe', to: 'list_recipes#destroy', as: 'remove_recipe'


  # ~~ welcome routes ~~ #
  root 'welcome#re_route'

  # ~~ application routes ~~ #
  post '/clear', to: 'application#clear', as: 'clear_cookies'

  # ~~ sessions routes ~~ #
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'

end
