class SaleInvoicesController < ApplicationController

  def edit
    @member = Member.find(params[:id])
    @credit = @member.find(params[:credit_card_id])
  end

  def update
    @credit.update(credit_card_params)
    redirect_to _path
  end

  def destroy
    credit = CreditCard.find(params[:id])
    credit.destroy
    redirect_to _path
  end

  private

  def credit_card_params
    require(:credit_card).permit(:credit_card_number :credit_card_holder :exp_month :exp_year)
  end

end
