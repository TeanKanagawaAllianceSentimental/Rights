class Admin::SaleItemsController < Admin::AdminBase

  def index # member購入履歴 詳細
    member_id = params[:member_id]
    @sales = Sale.where(member_id: member_id)
    @sale = @sales.find(params[:id])
    @credit = @sale.credit_card
    @invoice = @sale.sale_invoice
    @shippings =Shipping.where(member_is: member_id)
    @shipping = @shippings.fing(params[sale.id])
  end

end

