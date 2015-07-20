class CommentsController < ApplicationController
  before_filter :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment has been created!"
      redirect_to :back
    else
      flash.now[:alert] = "Your new comment couldn't be created!  Please check the form."
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to posts_path
  end

  private

  def comment_params
    params[:comment]
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
