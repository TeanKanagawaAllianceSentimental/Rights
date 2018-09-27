class SaleItemsController < ApplicationController
  def create # 購入確定
    member_id = current_member_id
    sale_items = SaleItem.new(sale_item_params)
    if sale_items.save
      # redirect_to sale_path(sale.id)
    else
      render 'items/show'
      flash[:error] = ""
    end
  end

  def method_name
    
  end



  private

  def sele_item_path
    params.require(:sale_item).permit(:quantity, :unit_price, :sale_id, :items_id)
  end

end
