class Admin::CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  # before_action :set_comment, only: [:destroy]

   def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.customer = current_customer

    if @comment.save
      redirect_to @post, notice: 'コメントを投稿しました。'
    else
      render 'posts/show'
    end
   end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer, notice: 'コメントを削除しました。'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_comment
    @post = Post.find(params[:id])
    @comment = @post.comments
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

