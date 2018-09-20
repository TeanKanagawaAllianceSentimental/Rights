class Admin::GenresController < ApplicationController
  def index
  end

  def new
  	@genre = Genre.new
    @genre.items.build
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  private

  def genre_params
  	params.require(:genre).permit(:genre, items_attributes:[:cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status])
  end
end
