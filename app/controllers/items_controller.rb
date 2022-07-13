class ItemsController < ApplicationController
  before_action :authorize, except: [:menu]

  def menu
    render :menu
  end

  def index
    @items = Item.all
    render :index
  end

  def new
    @order = Order.find(params[:order_id])
    @item = @order.items.new
    if params[:sort] == "burger"
      @item.dish = "burger"
    elsif params[:sort] == "pizza"
      @item.dish = "pizza"
    elsif params[:sort] == "salad"
      @item.dish = "salad"
    elsif params[:sort] == "app_side"
      @item.dish = "app_side"
    elsif params[:sort] == "drink"
      @item.dish = "drink"
    end
    render :new
  end

  def create
    @order = Order.find(params[:order_id])
    @item = @order.items.new(item_params)
    if @item.save
      item_cost(@item)
      flash[:notice] = "Item succesfully added"
      redirect_to order_path(@order)
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
      item_cost(@item)
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
    params.require(:item).permit(:dish, :cost, :size, :app_side, :drink_type, :order_id, :toppings => [])
  end

  def item_cost(item)
    if item.dish == 'pizza' && item.size == "small"
      item.cost = (item.toppings.count * 1) + 10
      item.save
    elsif item.dish == 'pizza' && item.size == "medium"
      item.cost = (item.toppings.count * 1) + 13
      item.save
    elsif item.dish == 'pizza' && item.size == "large"
      item.cost = (item.toppings.count * 1) + 16
      item.save
    elsif item.dish == 'burger' 
      item.cost = (item.toppings.count * 1) + 10
      item.save
    elsif item.dish == 'drink' && item.size == "small"
      item.cost = 3
      item.save
    elsif item.dish == 'drink' && item.size == "medium"
      item.cost = 6
      item.save
    elsif item.dish == 'drink' && item.size == "large"
      item.cost = 9
      item.save
    elsif item.dish == 'salad' 
      item.cost = (item.toppings.count * 1) + 10
      item.save
    elsif item.dish == 'app_side'
      item.cost = 8
      item.save
    end
  end
end