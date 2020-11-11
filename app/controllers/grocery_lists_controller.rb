class GroceryListsController < ApplicationController

    before_action :current_grocery_list_object
    
    def show
        session[:page] = "grocery_list"
    end

end
