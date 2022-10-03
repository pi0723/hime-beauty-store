class Destination < ApplicationRecord
  has_one    :order
  belongs_to :prefecture_id
end
