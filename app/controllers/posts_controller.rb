class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
  end

  def show
    @post = Post.find(params[:id])
  end
end
