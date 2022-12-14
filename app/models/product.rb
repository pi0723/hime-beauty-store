class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :made_in
  has_one_attached :image
  has_many         :cart_items
  has_many         :likes, dependent: :destroy
  has_one          :order

  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
    validates :title
    validates :explanation
    validates :volume
    validates :ingredient
    validates :image
  end

  validates :made_in_id, numericality: { other_than: 1 }

  def liked?(user)
    likes.where(user_id: user.id).exists?
 end

end