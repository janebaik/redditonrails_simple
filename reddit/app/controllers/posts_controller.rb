class PostsController < ApplicationController

    before_action :ensure_logged_in
    
    def new
        @post = Post.new
        render :new
    end

    def show 
        @post = Post.find(params[:id])
        render :show
    end

    def create
        @post = Post.new(post_params)
        if @post.save 
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end 

    def edit
        @post = current_user.posts.find(params[:id])
        if @post
            render :edit
        end
    end

    def update
        @post = current_user.posts.find(params[:id])
        @post.author_id = current_user.id
        if @post.update(post_params)
        else
            flash[:errors] = @post.errors.full_messages
        end
        redirect_to post_url(@post)
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        if @post && @post.delete 
            redirect_to posts_url
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content)
    end


end
