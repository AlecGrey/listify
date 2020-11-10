class WelcomeController < ApplicationController

    before_action :current_grocery_list_object

    def home
        @recipes = Recipe.all
    end

    def about
    end

end