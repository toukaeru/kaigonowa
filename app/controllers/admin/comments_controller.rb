class Admin::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  
   def create
    @comment = @post.comments.new(comment_params)
    @comment.customer = current_customer

    if @comment.save
      redirect_to @post, notice: 'コメントを投稿しました。'
    else
      render 'posts/show'
    end
   end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'コメントを削除しました。'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
  
  