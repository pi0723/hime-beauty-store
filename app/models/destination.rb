class Destination < ApplicationRecord
  has_one    :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # with_options presence: true do
  #   validates :last_name
  #   validates :first_name
  #   validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角数字でハイフン(-)を入れて入力してください' }
  #   validates :city
  #   validates :address, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
  #   validates :phone, format: { with: /\A\d{10,11}\z/, message: '半角数字で入力してください(ハイフンなし)' }
  # end

  # validates :prefecture_id, numericality: { other_than: 1 }
end
