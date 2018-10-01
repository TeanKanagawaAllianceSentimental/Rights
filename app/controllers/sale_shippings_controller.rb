class SaleShippingsController < ApplicationController

  def new # 配送先指定
    # @member = Member.find(session[:member_id])
    # @member = current_member
    @shippings = current_member.sale_shippings
    @sale = Sale.where(member_id: current_member).last
    # # @shippinga = @shippings.(current_member.id)
    # @shippinga = SaleShipping.find(params[:id])
    # @shippinga = SaleShipping.where(id: :member_id).first
    @shipping = SaleShipping.new
  end

  def create # 配送先確定ボタン押下
    member = current_member
    sale = Sale.where(member_id: current_member).last
    shippings = member.sale_shippings
    shipping = shippings.find_by(sale_id: sale)
    if shippingz>0
      shipping.update(sale_shipping_params)
      redirect_to sale_pay_selects_path(sale.id)
    elsif shipping = 0
      shipping = SaleShipping.new
      shipping.save(sale_shipping_params)
      redirect_to sale_pay_selects_path(sale.id)
    else
      @shippings = current_member.sale_shippings
      @sale = Sale.where(member_id: current_member).last
      @shippinga = @shippings.find(current_member.id)
      render 'sale_shipping/show'
    end
  end

  def new
    @shipping = SaleShipping.new
  end

  def show
    @member = current_member
    @addresses = @member.addressess
    @shippings = @member.sale_shippings
    @shipping = @shippings.find(params[:sale_id])
  end

  def index
    @member = current_member
    @shippings = @member.sale_shippings
  end

  def edit # 編集
    @shipping = SaleShipping.find(params[:id])
  end

  def destroy
    shipping = SaleShipping.find(params[:id])
    sale = Sale.find(params[:id])
    shipping.destroy
    redirect_to sale_sale_shippings_path(sale.id)
  end

  private

    def sale_shipping_params
      params.require(:sale_shipping).permit(:organisation_name, :shipping_postal_code, :shipping_address1, :shipping_address2, :department, :contact_person, :user_telephone, :sale_id, :member_id)
    end

    def sale_params
      params.require(:sale).permit(:sale_shipping_id)
    end

end
