class CartItemsController < ApplicationController

  def update
    get_item.update!(update_params)
    redirect_to carts_path, notice: '商品数を更新しました'
  end

  def destroy
    get_item.destroy
    redirect_to carts_path, notice: '商品を削除しました'
  end

  private

  def get_item
    Item.find(params[:id])
  end

  def update_params
    params.require(:item).permit(:quantity)
  end

end
