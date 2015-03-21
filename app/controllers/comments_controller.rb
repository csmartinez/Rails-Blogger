class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    if @comment.save
        flash[:notice] = "Comment successfully added!"
        redirect_to posts_path
      else
        render :new
      end
    end
  end
