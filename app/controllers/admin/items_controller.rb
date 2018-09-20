class Admin::ItemsController < Admin::AdminBase
  def index
  end

  def edit
  end

  private

  def item_params
  	params.require(:item).permit(:cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status)
  end

end
