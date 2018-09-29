class SaleItemsController < ApplicationController

  def create # 購入確定
    sale = Sale.where(member_id: current_member).last
    sale.member = current_member
    sale_items = SaleItem.new(sale_item_params)
    sale_items.each do |sale_item|
      sale_item.save
    end
      redirect_to orderplaced_sale_path(sale.id)
  end
  def index
    @sales = current_member.sales
    a = @sales.pluck(:id)

    @sale_items = @sales.where(sale_id: a)
    sale = Sale.create(total_price: 1000, member_id: 7, delivered: "配送済", delivered_at: "2018/09/29", Application: "aaa", credit_card_id: 1, sale_invoice_id: 1 )
  end
  def method_name

  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:quantity, :unit_price, :sale_id, :item_id)
  end

end
