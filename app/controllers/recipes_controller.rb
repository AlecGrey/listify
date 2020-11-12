class RecipesController < ApplicationController

    def show
        session[:page] = "recipe"
        @recipe = Recipe.find(params[:id])
    end

end
