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
end
