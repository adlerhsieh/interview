class PostsController < ApplicationController
  before_action :find_post, only: %i(show edit update)
  def index
    @posts = Post.includes(:user).order('id DESC').all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post is created.'
      redirect_to posts_path
    else
      flash[:notice] = 'Post is not created.'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post is updated.'
      redirect_to posts_path
    else
      flash[:notice] = 'Post is not updated.'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post is destroyed.'
    else
      flash[:notice] = 'Post is not destroyed.'
    end
    redirect_to posts_path
  end

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :user_id)
    end
end
