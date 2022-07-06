class ItemsController < ApplicationController

  def index
    @items = Item.all
    render :index
  end

  def new
    @order = Order.find(params[:order_id])
    @item = @order.items.new
    render :new
  end

  def create
    @order = Order.find(params[:order_id])
    @item = @order.items.new(item_params)
    if @item.save
      flash[:notice] = "Item succesfully added"
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:order_id])
    @item = Item.find(params[:id])
    render :edit
  end

  def show
    @order = Order.find(params[:order_id])
    @item = Item.find(params[:id])
    render :show
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "Item successfully updated"
      redirect_to order_path(@item.order)
    else
      @order = Order.find(params[:order_id])
      render :edit 
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item successfully deleted"
    redirect_to order_path(@item.order)
  end

  private 
  def item_params
    params.require(:item).permit(:dish, :toppings, :cost, :size, :app_side, :drink_type, :order_id)
  end
end