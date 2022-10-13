class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

def show
  likes = Like.where(user_id: @user.id).pluck(:product_id)
  @like_products = Product.find(likes)
end

private

  def set_user
    @user = User.find(params[:id])
  end
end
