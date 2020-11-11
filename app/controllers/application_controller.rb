class ApplicationController < ActionController::Base
    
    before_action :clear_page_data, :find_user

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

    def clear_page_data
        session.delete :page
    end

    def find_user
        @user = User.find_by_id(session[:user_id])
    end
end
