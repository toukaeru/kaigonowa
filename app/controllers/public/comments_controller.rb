class Public::CommentsController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    comment = current_customer.comments.new(post_id: @post.id)
    comment.post_id = @post.id
    comment.comment = params[:comment][:content]
    if comment.save
      comment.create_notification_comment!(current_customer, @post.customer_id)
      redirect_to post_path(@post.id)
    else
    @post_comment = Post.new
    render 'public/posts/show'
    end
   end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
