class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart_total

  def cart_total(order)
    total = 0
    order.items.each do |item|
      total += item.cost.to_i
    end
    total
  end

  def authorize
    if !current_user
      flash[:alert] = "You need to be signed-in to place an order."
      redirect_to '/'
    end
  end
end
