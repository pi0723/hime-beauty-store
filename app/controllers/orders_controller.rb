class OrdersController < ApplicationController
  before_action :get_cart

  def new
  end

  def create
    # charge_idを代入
    # order_codeランダム生成し代入
    @order.order_code = SecureRandom.uuid
    # sold_atを生成
    
    # カートからオーダーへ情報を移す
    assign_from_cart(@cart)
  end

  private

  def get_cart
    @cart = Cart.find_by(user_id: current_user.id)
    redirect_to carts_path if @cart.blank?
  end

end