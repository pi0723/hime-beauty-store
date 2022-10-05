class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  with_options presence: true do
    validates :quantity,
    validates :price,
    validates :price_with_tax
  end

end