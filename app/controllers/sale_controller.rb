sclass SaleController < ApplicationController

  def index #　購入一覧(マイページ)
    @member = current_member
    @sales = @member.all
  end

  def create # 購入するボタン
    sale = Sale.new(sale_params)
    sale.member_id = current_member_id
    if sale.save?
      redirect_to sale_path(sale.id)
    else
      render 'items/show'
      flash[:error] = ""
    end
  end

  def show # カートの中身
    # @member = Member.find(session[:member_id])
    @member = current_member
    @addresses = @member.sale_shippings
    # @addresses = SaleShipping.find(params[:member_id])
    @sale = Sale.where(member_id: current_member).last
    # @sale = Sale.find(params[:id])
    @address = SaleShipping.new
    @carts = @member.carts
    @cart = Cart.find(params[:id])
    @sub_total = @cart.unit_price.to_i * @cart.quantity.to_i
    # @items = @carts.items
  end

  def edit # 購入内容の確認
    # @member = Member.find(session[:member_id])
    @member = current_member
    @sale = @member.sales
    @credit = @sale.find(params[:credit_card_id])
    @invoice = @sale.find(params[:sale_invoice_id])
    @sale_item = SaleItem.new
    @items = @member.carts
  end

  def update # 合計金額
    # cart = Cart.where(:member_id session[:member_id])
    carts = Cart.where(member_id: current_member)
    total_price = 0
    carts.each do |cart|
      total_price += cart.unit_price * cart.quantity
    end
    total_price.update
    redirect_to sale_path(sale.id)
  end

  def continue_purchase # 購入ボタン押下
    sale = Sale.find(params[:id])
    if sale.update(sale_params)
      redirect_to sale_shipping_path(sale.id)
    else
      render 'sale/show'
    end
  end

  def confirm_purchase # 購入確定ボタン押下
    sale = Sale.find(params[:id])
    if sale.application < 2
      sale.update(sale_params)
      redirect_to new_applicant_path
    else
      sale.update(sale_params)
      redirect_to orderplaced_sale_path(sale.id)
    end
  end

  private

  def sale_params
    require(:sale).permit(:total_price, :sele_invoice_id, :credit_card_id, :shipping_address_id, :Application, :member_id)
  end

  # def continue_purchase_params
    
  # end

  # def confirm_purchase_params
    
  # end

end
