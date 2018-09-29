class Admin::SaleItemsController < Admin::AdminBase

  def index
    @sales = Sale.all
    # @sale = @sales.find(params[:sale_id])
    # @sale_items = @sale.sale_items
  end

	def show
		# @sales = Sale.find(params[:sale_id])
		# @sale_items = @sales.sale_items
	end
end
