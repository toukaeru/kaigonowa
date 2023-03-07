class Public::CategorysController < ApplicationController
  def index
    @categorys = Category.all
    if params[:category_id].present?
      category = Category.find(params[:category_id])
      @posts = Post.where(category: category)
    else
      @posts = Post.all
    end
  end

  def create
  end

  def edit
  end

  def update
  end
end
