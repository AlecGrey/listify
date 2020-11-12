class ListRecipesController < ApplicationController
    
    before_action :find_recipe, :find_grocery_list
    skip_before_action :clear_page_data, only: :create
    after_action :clear_page_data, only: :create
    
    def create
        # byebug
        if @grocery_list.recipes.include?(@recipe)
            flash[:error] = "That recipe is already on your list!"
        else
            flash[:success] = "Recipe successfully added."
            @grocery_list.recipes << @recipe
        end
        if session[:page] == "recipe"
            redirect_to @recipe
        else          
            redirect_to @grocery_list
        end
    end

    def destroy
        @grocery_list.recipes.delete(@recipe) if @grocery_list.recipes.include?(@recipe)
        if session[:page] == "grocery_list"
            redirect_to @grocery_list
        else
            redirect_to @grocery_list
        end
    end

    private

    def find_grocery_list
        @grocery_list = GroceryList.find_by_id(params[:grocery_list_obj])
    end

    def find_recipe
        @recipe = Recipe.find_by_id(params[:recipe_obj])
    end
    
end
