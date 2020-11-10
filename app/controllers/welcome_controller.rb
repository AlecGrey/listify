class WelcomeController < ApplicationController

    def home
        @recipes = Recipe.all
    end

    def about
    end

end