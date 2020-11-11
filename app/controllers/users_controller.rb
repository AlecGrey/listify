class UsersController < ApplicationController

    def new
        session[:page] = "sign-up"
        @user = User.new
    end

    def create
        # byebug
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:signup_errors] = parse_errors
            redirect_to sign_up_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def parse_errors
        convert_errors = {
            "password_confirmation" => "Passwords do not match!",
            "password" => "Password cannot be blank!",
            "name" => "Username cannot be blank!"
        }

        @user.errors.messages.keys.map do |err|
            convert_errors[err.to_s]
        end        
    end

end
