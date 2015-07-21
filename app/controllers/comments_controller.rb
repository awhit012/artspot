class CommentsController < ApplicationController
  before_filter :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render :layout => false }
      end
    else
      flash[:alert] = "Check the comment form, something went wrong."
      render root_path
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
