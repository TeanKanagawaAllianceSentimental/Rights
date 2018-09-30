class SaleController < ApplicationController

  def index # 購入一覧(マイページ)
    @member = current_member
    @sales = @member.all
  end

  def create # 購入するボタン
    sale = Sale.new
    sale.member_id = current_member.id
    if sale.save
      redirect_to sale_path(sale.id)
    else
      render 'items/show'
      flash[:error] = ""
    end
  end

  def show # カートの中身
    # @member = Member.find(session[:member_id])
    @member = current_member
    @sale = Sale.where(member_id: current_member).last
    @carts = @member.carts
    # @cart = Cart.find(4)
    # @item = @cart.item
    @sub_total = 0
    @carts.each do |cart|
      @sub_total += cart.unit_price.to_i * cart.quantity.to_i
    end
    # @sub_total = @cart.unit_price.to_i * @cart.quantity.to_i
  end

  def edit # 購入内容の確認
    # @member = Member.find(session[:member_id])
    @member = current_member
    @sale = Sale.where(member_id: current_member).last
    @shippings = @member.sale_shippings
    @shipping = @shippings.find(@sale.id)
    @credit = @sale.credit_card
    @invoice = @sale.sale_invoice
    @sale_item = SaleItem.new
    @carts = @member.carts
    @cart = Cart.find(params[:id])
    @item = @cart.item
    @sub_total = @item.unit_price.to_i * @cart.quantity.to_i
  end

  def update
    sale = Sale.where(member_id: current_member).last(sale_params)
    sale.member_id = current_member_id
    sale_items = SaleItem.new(sale_item_params)
    if sale.update
      sale_items.save
      redirect_back fallback_location: root
    else
      render 'sale/edit'
      flash[:error] = ""
    end
  end

  def amount_show # カートの中身確認　合計金額再計算ボタン押下
    # cart = Cart.where(:member_id session[:member_id])
    carts = Cart.where(member_id: current_member.id)
    total_price = 0
    carts.each do |cart|
      total_price += cart.item.unit_price * cart.quantity
      #本当はcart.unit_price
    end
    # total_price.update(amount_params)
    sale = Sale.find(params[:id])
    sale.total_price = total_price
    sale.save
    redirect_to sale_path(sale.id)
  end

  def amount_edit # 注文確認　合計金額再計算ボタン押下
    # cart = Cart.where(:member_id session[:member_id])
    carts = Cart.where(member_id: current_member.id)
    total_price = 0
    carts.each do |cart|
      total_price += cart.item.unit_price * cart.quantity
      #本当はcart.unit_price
    end
    # total_price.update(amount_params)
    sale = Sale.find(params[:id])
    sale.total_price = total_price
    sale.save
    redirect_to edit_sale_path(sale.id)
  end

  def proceed_purchase # レジに進むボタン押下
    sale = Sale.find(params[:id])
    if sale.update(sale_params)

      ##########
      redirect_to new_sale_sale_shipping_path(sale_id: sale.id)
    else
      render 'sale/show'
    end
  end

  def confirm_purchase # 購入確定ボタン押下
    sale = Sale.find(params[:id])
    if sale.Application < 1
      sale.update(sale_params)
    else
      sale.update(sale_params)
      redirect_to orderplaced_sale_path(sale.id)
    end
  end

  def orderplaced
  end

  private

  def sale_params
    params.require(:sale).permit(:total_price, :sele_invoice_id, :credit_card_id, :shipping_address_id, :Application, :member_id)
  end

  def sele_item_params
    params.require(:sale_item).permit(:quantity, :unit_price, :sale_id, :items_id, :unit_price)
  end

    def amount_params
      params.require(:sale).permit(:total_price)
    end

end
