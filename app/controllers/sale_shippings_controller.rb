class SaleShippingsController < ApplicationController

  def index # マイページ
    @member = Member.find(params[:id])
    @addresses = @member.sale_shipping
  end

  def show # 配送先指定
    # @member = Member.find(session[:member_id])
    @member = current_member
    @shippings = current_member.sale_shippings
    @sale = Sale.where(member_id: current_member).last
    @shippinga = @shippings.(current_member.id)
    # @shippinga = Sale.weher(member_id: current_member)
    @shipping = SaleShipping.new
  end

  # def proceed_purchase # showのsubmitボタン（配送先確定）押下
  #   sale = Sale.where(member_id: current_member).last
  #   shippings = sale.sale_shipngs
  #   if shippings.id.present?
  #     # sale.update(sale_params)
  #     redirect_to sale_pay_selects_path(sale.id)
  #   elsif shippings.id.nil?
  #     shipping = SaleShipping.new
  #     shipping.save(sale_shipping_params)
  #     # sale.update(sale_params)
  #     redirect_to sale_pay_select_path(sale.id)
  #   else
  #     render 'sale_shipping/show'
  #   end
  # end

  # def create
  #   shipping = SaleShipping.new
  #   sale = Sale.where(member_id: current_member).last
  #   if
  #   else
  #     @member = current_member
  #     @shippings = @member.sale_shippings
  #     render 'sale_shipping/show'
  #   end
  # end

  def edit # 編集
    @shipping = SaleShipping.find(params[:id])
  end

  def update
    member = current_member
    sale = Sale.where(member_id: current_member).last
    shippings = member.sale_shippings
    shipping = shippings.find_by(sale_id: sale)
    if shipping.present?
      shipping.update(sale_shipping_params)
      redirect_to sale_pay_selects_path(sale.id)
    elsif shipping.nil?
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
