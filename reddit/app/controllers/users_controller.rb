class UsersController < ApplicationController

    before_action :ensure_logged_in, only: [:index, :show, :destroy, :edit]
    def new
        @user = User.new
        render :new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def index 
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    # def update
    #     # saves it the db
    #     @user = User.find(params[:id])
    #     # if @user.update_attributes(user_params)
    #     if @user.update(user_params)
    #         redirect_to user_url(@user)
    #     else
    #         render :edit 
    #     end
    # end

    # def edit
    #     # brings up the page
    #     @user = User.find_by(id: params[:id])
    #     render :edit
    # end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user && @user.delete
            redirect_to new_user_url
        end
    end

    private
    def user_params
        params.requier(:user).permit(:username, :password)
    end


end
