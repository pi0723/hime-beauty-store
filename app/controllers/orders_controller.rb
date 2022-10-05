class OrdersController < ApplicationController
  before_action :get_cart

  def new
    @destination_order = DestinationOrder.new
  end

  def create
    @destination_order = DestinationOrder.new(destination_params)
    if @destination_order.valid?
      @destination_order.save
      # カートからオーダーへ情報を移す
      assign_from_cart(@cart)
      redirect_to root_path
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
          .merge(user_id: current_user.id, charge_id: params[:charge_id])
  end

end
