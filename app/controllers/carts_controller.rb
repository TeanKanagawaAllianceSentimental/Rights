class CartsController < ApplicationController

	def create
		if @cart = Cart.add_item(params[:item_id], current_member_id, session_id)
      redirect_to item_path(params[:item_id])
    else
      flash[:error] = 'カートに商品を追加することができませんでした。'
      render "items/show"
		end
	end

	def update
		if @cart.update_quantity(params[:cart][:quantity].to_i)
      flash[:success] = "#{@cart.item.name} の数量を変更しました。"
      redirect_to item_path(params[:item_id])
    else
      flash[:error] = '数量を変更することができません。'
      render "items/show"
    end
	end

	def destroy
		@cart.destroy
    flash[:success] = "#{@cart.item.cd_title} をカートから削除しました。"
    redirect_to 
	end

end