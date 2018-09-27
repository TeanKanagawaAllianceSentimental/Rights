class CartsController < ApplicationController

	def create
		if @cart = Cart.add_item(params[:item_id],session_id)
      redirect_to item_path(params[:item_id], cart_added: true)
    else
      flash[:error] = 'カートに商品を追加することができませんでした。'
      render "items/show"
		end
	end

	def update
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
		if cart.update_quantity(quantity: params[:quantity].to_i)
      redirect_to sale_path(sale.id)
    else
      render "items/show"
    end
	end

	def destroy
		@cart.destroy
    flash[:success] = "#{@cart.item.cd_title} をカートから削除しました。"
    redirect_to sale_path(sale.id)
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