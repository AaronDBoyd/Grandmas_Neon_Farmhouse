class OrdersController < ApplicationController
  # before_action :authenticate_user!, :only => [:new, :edit, :destroy, :update] do
  #   redirect_to new_user_session_path unless current_user && current_user.admin
  # end
  before_action :authorize, except: [:about]


  def index
    @orders = Order.all
    render :index
  end

  def new
    @order = Order.new
    render :new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order succesfully started"
      redirect_to order_path(@order)
    else 
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    render :edit
  end

  def show
    @order = Order.find(params[:id])
    render :show
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      order_total(@order)
      flash[:notice] = "Order successfully updated"
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Order successfuly deleted"
    redirect_to orders_path
  end
  
  def home
    render :home
  end

  def about 
    render :about
  end

  private 
    def order_params
      params.require(:order).permit(:total_cost, :user_id)
    end

    def order_total(order)
      order.total_cost = 0
      order.items.each do |item|
        order.total_cost += item.cost
      end
      order.save
    end
end