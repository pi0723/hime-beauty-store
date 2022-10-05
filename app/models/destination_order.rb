class DestinationOrder
  include ActiveModel::Model
  attr_accessor :last_name, :first_name, :post_code, :city, :address, :building, :phone, :prefecture_id,
                :user_id, :charge_id

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角数字でハイフン(-)を入れて入力してください' }
    validates :city
    validates :address, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: '半角数字で入力してください(ハイフンなし)' }
    validates :user_id
    validates :charge_id
    # validates :sold_at
    # validates :order_code
  end
              
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    destination = Destination.create(
      last_name: last_name,
      first_name: first_name,
      post_code: post_code,
      city: city,
      address: address,
      building: building,
      phone: phone,
      prefecture_id: prefecture_id)

    Order.create(
      user_id: user_id,
      charge_id: charge_id,
      destination_id: destination.id
      # order_code: SecureRandom.uuid,
      # sold_at: Time.new  
    )
  end
end