class ListRecipesController < ApplicationController
    
    before_action :current_grocery_list_object, :find_recipe
    
    def create
        if @grocery_list.recipes.include?(@recipe)
            flash[:error] = "That recipe is already on your list!"
        else
            @grocery_list.recipes << @recipe
        end            
        redirect_to root_path
    end

    def destroy
        @grocery_list.recipes.delete(@recipe) if @grocery_list.recipes.include?(@recipe)
        redirect_to root_path
    end

    private

    def find_recipe
        @recipe = Recipe.find_by_id(params[:recipe_obj])
    end
    
end
