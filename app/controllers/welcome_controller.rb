class WelcomeController < ApplicationController

    before_action :current_grocery_list_object
    before_action :login_redirect, only: [:home]

    def home
        session[:page] = "root"
        @recipes = Recipe.all
        render :home
    end

    def about
    end

end