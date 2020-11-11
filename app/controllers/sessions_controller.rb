class SessionsController < ApplicationController

    before_action :already_logged_in_error, only: :new
    before_action :find_user, only: :create

    def new
        session[:page] = "login"
    end

    def create
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:error] = "Invalid Login!"
            redirect_to login_path
        end
    end

    def destroy
    end

    private

    def session_params
        params.require(:user).permit(:name, :password)
    end

    def find_user
        @user = User.find_by(name: session_params[:name])
    end

    def already_logged_in_error
        if logged_in?
            flash[:error] = "You are already logged-in as a user!"
        end
    end

end