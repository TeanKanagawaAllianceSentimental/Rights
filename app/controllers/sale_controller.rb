class SaleController < ApplicationController

  def index #　購入一覧(マイページ)
    
  end

  def create # 購入するボタン
    Sale.save
    redirect_to 
  end

  def show # カートの中身
    @member = Member.find(session[:menber_id])
    @addresses = SalesShipping.where(params[:member_id])
    @sale = Sale.find(params[:id])
    @address = SaleShipping.new
    @sub_total = @member.cart.quantity * @member.cart.item.unit_price
    @total_price = @sub_total.sum
  end

  def edit # 購入内容の確認
    @member = Member.find(session[:member_id])
    @credit = @member.sale.find(params[:credit_card_id])
    @invoice = @member.sale.find(params[:sale_invoice_id])
    @sale_item = SaleItem.new
    @items = @member.cart.where(params[:item_id])
  end

  def update # 一連の購入手続き
    member = Member.find(session[:menber_id])
    @sub_total = member.cart.quantity * member.cart.item.unit_price
  end

end
