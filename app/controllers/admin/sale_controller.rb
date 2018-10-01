class Admin::SaleController < ApplicationController
layout 'admin'
  def index
    @member_id = params[:member_id]
    @sales = Sale.where(member_id: @member_id)

    # @members = Member.where_(id: sale.id).all
    # @member =
    # @sales = @member.sales
  end

  def show
     # member購入履歴 詳細
    member_id = params[:member_id]
    @sale_id = Sale.find_by(id: params[:id])
    @sales = Sale.where(member_id: member_id)
    @sale = @sales.find(params[:id])
    # @credit = @sale.credit_card
    # @invoice = @sale.sale_invoice
    @shipping = SaleShipping.where(sale_id: @sale_id)
    # 元々の記述:全体の履歴 詳細用?
    # sale_id = params[:sale_id]
    # @sale_items = Sale.find(sale_id: sale_id)
    # @sale_items = @sales.sale_items
  end
end
