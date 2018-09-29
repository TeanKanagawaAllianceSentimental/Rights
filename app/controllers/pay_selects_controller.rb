class PaySelectsController < ApplicationController

  def show # お支払い方法選択
    # @member = Member.find(session[:member_id])
    @member = current_member
    @sale = Sale.where(member_id: current_member).last
    @credits = current_member.credit_cards
    @invoices = @member.sale_invoices
  end

  def proceed_purchase # お支払い方法選択 確定 => 注文確認画面へ
    @sale = Sale.where(member_id: current_member).last
    # credit_card = CreditCard.find(params[:id])
    # invoice = SaleInvoice.find(params[:id])
    if @sale.update(sale_params)
      redirect_to edit_sale_path(@sale.id)
    else
      @member = current_member
      @credits = @member.credit_cards
      @sale = @member.sales
      @invoices = @member.sale_invoices
      render 'pay_selects/show'
    end
  end

   private

    def sale_params
      params.require(:sale).permit(:sale_invoice_id, :credit_card_id)
    end

end
