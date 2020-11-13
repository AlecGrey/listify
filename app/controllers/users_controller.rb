class UsersController < ApplicationController

    before_action :redirect_to_authorized_user, only: :show
    skip_before_action :find_user, only: [:new, :create]

    def show
    end
    
    def new
        session[:page] = "sign-up"
        @user = User.new
    end

    def create
        # byebug
        @user = User.new(
            name: user_params[:name].downcase,
            password: user_params[:password],
            password_confirmation: user_params[:password_confirmation]
        )
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:signup_errors] = @user.errors.full_messages
            redirect_to sign_up_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    # def parse_errors
    #     convert_errors = {
    #         "password_confirmation" => "Passwords do not match!",
    #         "password" => "Password cannot be blank!",
    #         "name" => "Username cannot be blank!"
    #     }
    #     @user.errors.messages.keys.map do |err|
    #         convert_errors[err.to_s]
    #     end        
    # end

    def authorized_user?
        # byebug
        params[:id].to_i == session[:user_id].to_i
    end

    def redirect_to_authorized_user
        if !authorized_user?
            redirect_to @user
        end
    end

end
