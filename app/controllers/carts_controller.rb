class CartsController < ApplicationController

	def add_item
    # if current_member.carts Item.find(param[:id]).carts.where()
    i = 1
    current_member.carts.each do |cart|
      if cart.item_id == params[:id]
        # ある場合
        @cart = cart
        @cart.quantity += 1
        i += 1
      else
        if i == 1
          @cart = Cart.new
          # @cart.member_id = current_member.id
          @cart.item_id = params[:id]
          @cart.quantity = 1
          @cart.unit_price = Item.find(params[:id]).unit_price
        end
        i += 1
      end
    end
        # @cart = Cart.find(params[:id])
    @cart.save
    redirect_to item_path(params[:id])
  end

	def update_new
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
		if cart.update(quantity: quantity_params[:quantity].to_i)
      cart.update(quantity: quantity_params[:quantity].to_i)
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

  def update_edit
    cart = Cart.find(params[:id])
    sale = Sale.where(member_id: current_member).last
    if cart.update(quantity: quantity_params[:quantity].to_i)
      cart.update(quantity: quantity_params[:quantity].to_i)
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

