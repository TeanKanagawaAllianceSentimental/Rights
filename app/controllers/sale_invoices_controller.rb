class SaleInvoicesController < ApplicationController

  def generate
    member = current_member
    invoice = SaleInvoice.new(sale_invoice_params)
    invoice.save!
    redirect_to new_sale_invoice_path(member.id)
  end

  def create
    invoice = SaleInvoice.new
    sale = Sale.where(member_id: current_member).last
    if invoice.save(sale_invoice_params)
      redirect_to sale_pay_selects_path(sale.id)
    else
      @member = current_member
      @invoices = @member.sale_invoices
      render 'sale_invoice/edit'
    end
  end

  def new
    @member = current_member
    @invoice = SaleInvoice.new
    @invoices = @member.sale_invoices
  end

  def show
    @member = current_member
    @invoices = @member.sale_invoices
    @invoice = @invoices.find(params[:sale_id])
  end

  def index
    @member = current_member
    @invoices = @member.sale_invoices
  end

  def edit
    @member = current_member
    @invoices = @member.sale_invoices
    @invoice = @invoices.find(params[:id])
  end

  def update
    member = current_member
    sale = Sale.where(member_id: current_member).last
    invoices = member.sale_invoices
    invoice = invoices.find(params[:id])
    invoice.update(sale_invoice_params)
    redirect_to sale_pay_selects_path(sale.id)
  end

  def destroy
    invoice = SaleInvoice.find(params[:id])
    invoice.destroy
    redirect_to _path
  end

  private

  def sale_invoice_params
    params.require(:sale_invoice).permit(:bill_to, :contact_person, :department, :billing_postal_code, :billing_address1, :billing_address2, :member_id)
  end

end
