class GroceryListsController < ApplicationController
    
    def show
        @grocery_list = GroceryList.find(params[:id])
        session[:page] = "grocery_list"
    end

    def create
        @grocery_list = GroceryList.new(list_params)
        if @grocery_list.save
            redirect_to @grocery_list
        else
            flash[:error] = "Whoops!"
            redirect_to @user
        end
    end

    private

    def list_params
        params.require(:grocery_list).permit(:date, :user_id)
    end

end
