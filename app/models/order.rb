class Order < ApplicationRecord
  has_many :items, dependent: :destroy

  # def total_price
  #   @total_price ||= items.includes(:product).reduce(0) do |sum, l_prod|
  #     sum + (l_prod.count * l_prod.product.price)
  #   end
  # end
end
