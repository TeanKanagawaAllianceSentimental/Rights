class Admin::SaleController < ApplicationController

  def index
    @member = Member.find[:id]
    @sales = @member.sales
    @sale = @sales.find(params[:member_id])
    @sale_items = @sale.sale_items
  end

  def show
    @sales = Sale.find(params[:id])
    @sale_items = @sales.sale_items
  end

end
