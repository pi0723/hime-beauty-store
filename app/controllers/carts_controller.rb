class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_cart

  def add
    @cart.items.create!(add_params)
    redirect_to carts_path, notice: '商品数を追加しました'
  end

  def index
  end

  private

  def get_cart
    @cart = Cart.find(params[:user_id])
    @cart ||= Cart.create!
  end

  def add_params
    params.require(:item).permit(:product_id, :quantity)
  end

end
