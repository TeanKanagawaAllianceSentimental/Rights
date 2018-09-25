class PaySelectsController < ApplicationController

  def show # お支払い方法選択
    # @member = Member.find(session[:member_id])
    @member = current_member
    @credits = @member.credit_cards
    @credit = @credits.find(params[:mumber_id])
    @sale = @member.sales
    @invoices = @member.sale_invoices
    @invoice = @invoices.find(params[:mumber_id])
  end

  def create # お支払い方法選択 確定
    if sale.credit_card.nill?
      
    @sale.save
  end
  end


   private

    def sale_shipping_params
      params.require(:sale_shipping).permit(:organisation_name, :shipping_postal_code, :address1, :address2, :department, :contact_person, :user_telephone)
    end

    def sale_params
      params.require(:sale).permit(:sale_invoice_id, :credit_card_id)
    end

end
