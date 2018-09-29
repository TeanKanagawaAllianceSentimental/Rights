class SaleItemsController < ApplicationController

  def create # 購入確定
    member = current_member
    sale = Sale.where(member_id: current_member).last
    carts = member.carts
    carts.each do |cart|
      sale_items = SaleItem.new(sale_item_params)
      sale_items.save
    end
    carts.destroy
      redirect_to orderplaced_sale_path(sale.id)
  end

  def method_name
    
  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:quantity, :unit_price, :sale_id, :item_id)
  end

end
