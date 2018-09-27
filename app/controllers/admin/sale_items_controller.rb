class Admin::SaleItemsController < Admin::AdminBase

	def show
		@sales = Sale.find(params[:member_id])
		@sale_items = @sales.sale_items
	end
end
