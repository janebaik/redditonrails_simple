class SubsController < ApplicationController
    before_action :ensure_logged_in

    def new
        render :new
    end

    def index
        @subs = Sub.all 
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show

    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
        
    end

    def update
        @sub = current_user.subs.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def edit
        @sub = current_user.subs.find(params[:id])
        if @sub 
            render :edit 
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end