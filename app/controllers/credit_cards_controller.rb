class CreditCardsController < ApplicationController

  def edit
    @member = Member.find(params[:id])
    @invoice = @member.find(params[:sale_inovice_id])
  end

  def update
    @invoice.save(sale_invoice_params)
    redirect_to _path
  end

  def destroy
    invoice = CreditCard.find(params[:id])
    invoice.destroy
    redirect_to _path
  end

  private

  def sale_invoice_params
    require(:sale_inovice).permit(:bill_to :billing_postal_code :billing_address :contact_person :departmant)
  end

end
