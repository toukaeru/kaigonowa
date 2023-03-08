class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update]

  def index
    @customers = Customer.all
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save
     flash[:notice] ="You have updated user successfully."
     redirect_to customer_path(@customer.id)
    else
     render :edit
    end
  end

  def unsubscribe
     @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会が完了しました！"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_customer
    customer_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to customer_path(current_customer.id)
    end
  end
end
