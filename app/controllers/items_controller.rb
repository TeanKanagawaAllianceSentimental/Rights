class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
    @genre = Genre.find(params[:id])
  end

  private

  def item_params
  	params.require(:item).permit(:id, :cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status)
  end
end
