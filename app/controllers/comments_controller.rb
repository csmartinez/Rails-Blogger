class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
        flash[:notice] = "Comment successfully added!"
        redirect_to :back
      else
        render :new
      end
    end

  def new
    @comment = Comment.new
  end

  def comment_params
    params.require(:comment).permit(:author, :comment)
  end
end
