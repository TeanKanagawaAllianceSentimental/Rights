class SaleController < ApplicationController

  def new # カートの中身
    # @member = Member.find(session[:member_id])
    @member = current_member
    # @sale = Sale.where(member_id: current_member).last
    @sale = Sale.new
    @carts = @member.carts
  end

  def create # 購入するボタン
    sale = Sale.new
    sale.member_id = current_member.id

    if sale.save
      redirect_to new_sale_sale_shipping_path(sale_id: sale.id)
    else
      render 'sale/show'
    end
  end


  def amount_new # カートの中身確認 合計金額再計算ボタン押下
    carts = Cart.where(member_id: current_member.id)
    total_price = 0
    carts.each do |cart|
      total_price += cart.unit_price * cart.quantity
    end
    sale = Sale.find(params[:id])
    sale.total_price = total_price
    sale.save
    redirect_to sale_path(sale.id)

  def show # カートの中身
    # @member = Member.find(session[:member_id])
    @member = current_member.id
    @sale = Sale.where(member_id: current_member).last
    @carts = @member.carts
    @cart = Cart.find(params[:id])
    @item = @cart.item
    @sub_total = @cart.unit_price.to_i * @cart.quantity.to_i
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

  def amount_edit # 注文確認 合計金額再計算ボタン押下
    carts = Cart.where(member_id: current_member.id)
    total_price = 0
    carts.each do |cart|
      total_price += cart.unit_price * cart.quantity
    end
    sale = Sale.find(params[:id])
    sale.total_price = total_price
    sale.save
    redirect_to edit_sale_path(sale.id)
  end

  def confirm_purchase # 購入確定ボタン押下 sale_item controllerからorderplacedへredirect設定済
    sale = Sale.find(params[:id])
    if sale.Application < 1
      sale.update(sale_params)
    else
      sale.update(sale_params)
      redirect_to orderplaced_sale_path(sale.id)
    end
  end


  def update # これなんだ?もういらない?
    sale = Sale.where(member_id: current_member).last(sale_params)
    sale.member_id = current_member_id
    if sale.update
      # sale_items.save
      # redirect_back fallback_location: root
    else
      render 'sale/edit'
      flash[:error] = ""
    end
  end

  def show
    
  end

  def proceed_purchase # レジに進むボタン押下 see my github cartcoding
    sale = Sale.new(sale_params)
    if sale.save
      redirect_to new_sale_sale_shipping_path(sale_id: sale.id)
    else
      render 'sale/show'
    end
  end

  def amount_new # カートの中身確認 合計金額再計算ボタン押下 see my github cartcoding
    carts = Cart.where(member_id: current_member.id)
    total_price = 0
    carts.each do |cart|
      total_price += cart.unit_price * cart.quantity
    end
    sale = Sale.find(params[:id])
    sale.total_price = total_price
    sale.save
    redirect_to sale_path(sale.id)
  end


  private

  def sale_params
    params.require(:sale).permit(:total_price, :sele_invoice_id, :credit_card_id, :shipping_address_id, :Application, :member_id)
  end

  def sele_item_params
    params.require(:sale_item).permit(:quantity, :unit_price, :sale_id, :items_id, :unit_price)
  end

  def shipping_params
      params.require(:sale_shipping).permit(:organisation_name, :shipping_postal_code, :shipping_address1, :shipping_address2, :department, :contact_person, :user_telephone, :member_id)
  end

end
