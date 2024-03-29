class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to request.referer
  end

  def search
    if params[:keyword].present?
      @posts = Post.search_by_keyword(params[:keyword])
    else
      @post = Post.none
    end
  end
end
