class Public::CategorysController < ApplicationController
  
  def index
    @categorys = Category.all
    if params[:category_id].present?
      category = Category.find(params[:category_id])
      @posts = Post.where(category: category).page(params[:page]).per(6)
    else
      @posts = Post.page(params[:page]).per(6)
    end
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to request.referer
  end
end
