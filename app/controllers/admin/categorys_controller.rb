class Admin::CategorysController < ApplicationController

  def index
    @category = Category.new
    @categorys = Category.page(params[:page]).per(5)
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categorys_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to admin_categorys_path(@category)
  end

  def destroy
   @category = Category.find(params[:id])
   @category.destroy
   redirect_to request.referer
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end
end
