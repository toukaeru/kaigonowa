class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
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
end
