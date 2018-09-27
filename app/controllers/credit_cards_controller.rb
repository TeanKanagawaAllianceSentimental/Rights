class CreditCardsController < ApplicationController

  def create
    credit_card = CreditCard.new
    sale = Sale.where(member_id: current_member).last
    if credit_card.save(credit_card_params)
      redirect_to sale_pay_select(sale.id)
    else
      @member = current_member
    @credits = @member.credit_cards
      render 'credit_cards/edit'
    end
  end

  def edit
    @member = current_member
    @credits = @member.credit_cards
  end

  def update
    member = current_member
    sale = Sale.where(member_id: current_member).last
    credits = member.credit_cards
    credit = credits.find(params[:id])
    credit.update(credit_card_params)
    redirect_to sale_pay_select_path(sale.id)
  end

  def destroy
    credit = CreditCard.find(params[:id])
    credit.destroy
    redirect_to _path
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(:credit_card_number, :credit_card_holder, :exp_month, :exp_year)
  end

end
