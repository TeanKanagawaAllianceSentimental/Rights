class CartsController < ApplicationController

	def add_item
    # if current_member.carts Item.find(param[:id]).carts.where()

    # i = 1
    # current_member.carts.each do |cart|
    #   puts "a"
    #   if cart.item_id == params[:id]
    #     puts "b"
    #     # ある場合
    #     @cart = cart
    #     @cart.quantity += 1
    #     i += 1
    #   else
    #     if i == 1
    #       @cart = Cart.new
    #       @cart.member_id = current_member.id
    #       @cart.item_id = params[:id]
    #       @cart.quantity = 1
    #       @cart.unit_price = Item.find(params[:id]).unit_price
    #     end
    #     i += 1
    #   end
    # # @cart = Cart.find(params[:id])
    # @cart.save
    # end
    if Cart.exists?(member_id: current_member.id, item_id: params[:id])
      @cart = Cart.find(params[:id])
      redirect_to sale_path(@cart)
    else
      @cart = Cart.new
      @cart.member_id = current_member.id
      @cart.item_id = params[:id]
      @cart.quantity = 1
      @cart.unit_price = Item.find(params[:id]).unit_price
      @cart.save
      redirect_to item_path(params[:id])
    end
  end

	def update_show
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to sale_path(@cart)

  #   cart = Cart.find(params[:id])
  #   sale = Sale.where(member_id: current_member).last
		# if cart.update(quantity: quantity_params[:quantity].to_i)
  #     cart.update(quantity: quantity_params[:quantity].to_i)
  #     redirect_to sale_path(sale.id)
  #   else
  #     @member = current_member
  #     @sale = Sale.where(member_id: current_member).last
  #     @carts = @member.carts
  #     @cart = Cart.find(params[:id])
  #     @item = @cart.item
  #     @sub_total = @item.unit_price.to_i * @cart.quantity.to_i
  #     render "sales/show"
  #   end
	end

  def update_edit
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
    if cart.update(cart_params)
      redirect_to edit_sale_path(sale.id)
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

	def destroy_item # ショッピングカート画面での商品削除
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
		cart.destroy
    redirect_to sale_path(sale.id)
	end

  def destroy_cart # 購入確認画面での商品削除
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
    cart.destroy
    redirect_to edit_sale_path(sale.id)
  end

  private

    def cart_params
      params.require(:cart).permit(:quantity)
    end
end
