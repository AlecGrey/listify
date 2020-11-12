class GroceryListsController < ApplicationController
    
    before_action :find_list, only: [:show, :destroy]

    def show
        session[:page] = "grocery_list"
        session[:grocery_list_id] = @grocery_list.id
    end

    def create
        @grocery_list = GroceryList.new(list_params)
        if @grocery_list.save
            redirect_to @grocery_list
        else
            flash[:error] = "Please select a valid date."
            redirect_to @user
        end
    end

    def destroy
        # byebug
        @grocery_list.destroy
        redirect_to @user
    end

    private

    def find_list
        @grocery_list = GroceryList.find(params[:id])
    end

    def list_params
        params.require(:grocery_list).permit(:date, :user_id)
    end

end
