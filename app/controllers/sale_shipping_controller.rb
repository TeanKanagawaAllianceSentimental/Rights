class SaleShippingController < ApplicationController

  def index # マイページ
    @member = Member.find(params[:id])
    @addresses = @mamber.sale_shipping
  end

  def show # 配送先指定
    @member = Member.find(session[:member_id])
    @addresses = SaleShipping.where(params[:member_id])
    @sale = @member.sales.find(params[:id])
    @address = SaleShipping.new
  end

  def create
    @sale.save(sale_params)
    @address.save(sale_shipping_params)
    redirect_to 
  end

  def edit # 編集
    @address = SaleShipping.find(params[:id])
  end

  def update
    @address.update(sale_shipping_params)
    redirect_to 
  end

  def destroy
    address = SaleShipping.find(params[:id])
    address.destroy
    redirect_to 
  end

  private

    def sale_shipping_params
      params.require(:sale_shipping).permit(:organisation_name, :shipping_postal_code, :address1, :address2, :department, :contact_person, :user_telephone)
    end

    def sale_params
      params.require(:sale).permit(:sale_shipping_id)
    end

end
