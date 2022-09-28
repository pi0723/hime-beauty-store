class CartItem < ApplicationRecord

  belongs_to :cart
  belongs_to :product

  def sum_of_price
    product.price * quantity
  end

  validates :quantity, presence: true,
                       numericality: {
                        only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 30,
                        message: "半角数字で入力してください(30個まで)"}

end
