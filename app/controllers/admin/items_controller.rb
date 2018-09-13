class Admin::ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]
  def index
  	@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_admin_item_path
  end

  def edit
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
  	params.require(:item).permit(:cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status)
  end

end
