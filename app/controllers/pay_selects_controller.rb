class PaySelectsController < ApplicationController

  def show # お支払い方法選択
    @member = Member.find(session[:member_id])
    @credit = @member.credit_card
    @sale = @member.sales
    @invoice = @menber.sale_invoice
  end

  def create # お支払い方法選択 確定
    @sale.save
  end


   private

    def sale_shipping_params
      params.require(:sale_shipping).permit(:organisation_name, :shipping_postal_code, :address1, :address2, :department, :contact_person, :user_telephone)
    end

    def sale_params
      params.require(:sale).permit(:sale_invoice_id, :credit_card_id)
    end

end
