class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @comment = @post.comments.new
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Post successfully added!"
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
    if @post.update(params[:post])
      flash[:notice] = "Post successfully updated!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted."
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
