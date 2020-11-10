class ApplicationController < ActionController::Base
    
    before_action :find_session_grocery_list_id

    def clear
        reset_session
        redirect_to root_path
    end

    private

    def find_session_grocery_list_id
        session[:list_id] ||= GroceryList.create.id
    end

    def current_grocery_list_object
        @grocery_list = GroceryList.find_by_id(session[:list_id])
    end

end
