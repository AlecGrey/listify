Rails.application.routes.draw do
  resources :list_recipes
  resources :grocery_lists
  resources :ingredients
  resources :foods
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
