class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_cart

  #def add
  #  @cart.cart_items.create!(add_params)
  #  redirect_to carts_path
  #end

  def add
    if @cart.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
      cart_item = @cart.cart_items.find_by(product_id: params[:cart_item][:product_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to carts_path  
    else
      @cart.cart_items.create!(add_params)
      redirect_to carts_path
    end
  end

  def index
  end

  private

  def get_cart
    @cart = Cart.find_by(user_id: current_user.id)
    @cart ||= Cart.create!(user_id: current_user.id)
  end
  
  def add_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

end
