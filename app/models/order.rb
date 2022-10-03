class Order < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  has_many   :order_items
  accepts_nested_attributes_for :destination

  def assign_from_cart(cart)
    cart.cart_items.each do |item|
      order_items << OrderItem.new(
        product_id: item.product_id,
        quantity: item.quantity,
        price_with_tax: item.quantity * item.product.price,
        price: item.quantity * item.product.price / 1.1
      )
    end
  end
end
