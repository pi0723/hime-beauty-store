class LikesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @like = Like.create(user_id: current_user.id, product_id: @product.id)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @like = Like.find_by(user_id: current_user.id, product_id: @product.id)
    @like.destroy
  end
  
end
