class OrdersController < ApplicationController
  before_action :get_cart

  def new
    @destination_order = DestinationOrder.new
  end

  def create
    @destination_order = DestinationOrder.new(destination_params)
    if @destination_order.valid?
      pay_item
      @destination_order.save
    else
      render :new
    end
  end

  private

  def get_cart
    @cart = Cart.find_by(user_id: current_user.id)
    redirect_to carts_path if @cart.blank?
  end

  def destination_params
    params.require(:destination_order)
          .permit(:first_name, :last_name, :post_code, :city, :address, :building, :phone, :prefecture_id)
          .merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: total_price,
      card: destination_params[:token],
      currency: 'jpy'
    )
  end

  def total_price
    @cart.cart_items.sum do |item|
      item.quantity * item.product.price
    end
  end
end
