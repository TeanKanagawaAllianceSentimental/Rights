class CartsController < ApplicationController

	def create
		if @cart = Cart.add_item(add_item_params)# ,session_id
      redirect_to item_path(params[:item_id], cart_added: true)
    else
      flash[:error] = 'カートに商品を追加することができませんでした。'
      render "items/show"
		end
	end

	def update
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
		if cart.update(quantity: quantity_params[:quantity].to_i)
      redirect_to sale_path(sale.id)
    else
      @member = current_member
      @sale = Sale.where(member_id: current_member).last
      @carts = @member.carts
      @cart = Cart.find(params[:id])
      @item = @cart.item
      @sub_total = @item.unit_price.to_i * @cart.quantity.to_i
      render "sales/show"
    end
	end

	def destroy_item
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
		cart.destroy
    redirect_to sale_path(sale.id)
	end

  def destroy_cart
    sale = Sale.where(member_id: current_member).last
    carts = Cart.where(sale_id: sale).all
    carts.destroy
    redirect_to edit_sale_path(sale.id)
  end

  private

  def add_item_params
    params.require(:cart).permit(:session_id, :item_id, :quantity, :member_id, :unit_price)
  end

  def quantity_params
    params.require(:cart).permit(:quantity)
  end

end

# # カート詳細画面から、「更新」を押した時のアクション
#   def update_item
#     @cart_item.update(quantity: params[:quantity].to_i)
#     redirect_to current_cart
#   end

# 　# カート詳細画面から、「削除」を押した時のアクション
#   def delete_item
#     @cart_item.destroy
#     redirect_to current_cart
#   end