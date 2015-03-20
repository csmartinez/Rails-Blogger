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

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(params[:list])
      redirect_to posts_path
    else
      render :edit
    end
  end
end
