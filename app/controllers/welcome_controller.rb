class WelcomeController < ApplicationController

    before_action :login_redirect, only: [:home]

    def re_route
        if logged_in?
            redirect_to @user
        else
            redirect_to login_path
        end
    end
    
    # def home
    #     session[:page] = "root"
    #     @recipes = Recipe.all
    #     render :home
    # end

    def about
    end

end