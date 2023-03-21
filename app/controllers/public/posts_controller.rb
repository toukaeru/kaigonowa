class Public::PostsController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def index
    @categorys = Category.all
    @posts = Post.page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id =  current_customer.id
    if @post.save
      flash[:notice] = '投稿が完了しました'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to request.referer
  end

  def search
   @posts = Post.search_by_keyword(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def is_matching_login_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
      redirect_to posts_path
    end
  end
end
