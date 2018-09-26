class SaleShippingController < ApplicationController

  def index # マイページ
    @member = Member.find(current_member[:id])
    @addresses = @member.id
  end

  def show # 配送先指定
    # @member = Member.find(session[:member_id])
    @member = current_member
    @addresses = SaleShipping.where(member_id: current_member)
    @sale = Sale.where(member_id: current_member).last
    @address = SaleShipping.new
  end

  def create
    # address = SaleShipping.new(sale_shipping_params)
    sale = Sale.find(params[:id])
    sale.save(sale_params)
    address.save(sale_shipping_params)
    redirect_to pay_select_path(sale.id)
  end

  def edit # 編集
    @address = SaleShipping.find(params[:id])
  end

  def update
    address = SaleShipping.find(params[:id])
    @address.update(sale_shipping_params)
    redirect_to pay_select_path(sale.id)
  end

  def destroy
    address = SaleShipping.find(params[:id])
    address.destroy
    redirect_to pay_select_path(sale.id)
  end

  private

    def sale_shipping_params
      params.require(:sale_shipping).permit(:organisation_name, :shipping_postal_code, :shipping_address1, :shipping_address2, :department, :contact_person, :user_telephone)
    end

    def sale_params
      params.require(:sale).permit(:sale_shipping_id)
    end

end
