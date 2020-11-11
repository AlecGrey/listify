class ApplicationController < ActionController::Base
    
    before_action :clear_page_data
    before_action :find_session_grocery_list_id
    helper_method :logged_in?

    def clear
        reset_session
        redirect_to root_path
    end

    private

    def login_redirect
        redirect_to login_path unless logged_in?
    end

    def logged_in?
        !!session[:user_id]
    end

    def find_session_grocery_list_id
        session[:list_id] ||= GroceryList.create.id
    end

    def current_grocery_list_object
        @grocery_list = GroceryList.find_by_id(session[:list_id])
    end

    def clear_page_data
        session.delete :page
    end

end
