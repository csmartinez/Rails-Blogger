class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to  posts_path
    else
      render :new
    end
  end
end
