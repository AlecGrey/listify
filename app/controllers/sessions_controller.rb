class SessionsController < ApplicationController

    # before_action :already_logged_in_error, only: :new
    skip_before_action :find_user, only: [:new, :create]

    def new
        session[:page] = "login"
    end

    def create
        @user = User.find_by(name: session_params[:name].downcase)
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:error] = "Invalid Login!"
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end

    private

    def session_params
        params.require(:user).permit(:name, :password)
    end

    # def already_logged_in_error
    #     if logged_in?
    #         flash[:error] = "You are already logged-in as a user!"
    #     end
    # end

end