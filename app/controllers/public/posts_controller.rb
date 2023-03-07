class Public::PostsController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def index
    @categories = Category.all
  end

  def show
  end

  def create
     @post = Post.new(post_params)
    if @post.save
     redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
  
  def is_matching_login_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
      redirect_to posts_path
    end
  end
end
