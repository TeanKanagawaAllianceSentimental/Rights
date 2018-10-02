class Admin::SaleItemsController < Admin::AdminBase

  def index # member購入履歴 詳細
    member_id = params[:member_id]
    @sales = Sale.where(member_id: member_id)
    @sale = @sales.find(params[:id])
    @credit = @sale.credit_card
    @invoice = @sale.sale_invoice
    @shippings =Shipping.where(member_is: member_id)
    @shipping = @shippings.find(params[sale.id])
  end

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

  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:quantity, :unit_price, :sale_id, :item_id)
  end


end

