class ListRecipesController < ApplicationController
    
    before_action :current_grocery_list_object
    
    def create
        byebug
        @grocery_list.recipes << Recipe.find_by_id(params[:recipe_obj])
        redirect_to root_path
    end
    
end
