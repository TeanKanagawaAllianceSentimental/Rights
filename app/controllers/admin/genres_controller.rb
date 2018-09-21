class Admin::GenresController < Admin::AdminBase
  before_action :set_genre, only: [:edit, :update, :destroy]
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
  	@genre = Genre.new
    @item = @genre.items.build
    @disk = @item.disks.build
    @music = @disk.musics.build
  end

  def create
  	@genre = Genre.new(genre_params)
    @genre.save(genre_params)
    redirect_to admin_rights_path(@genre)
  end

  def edit
  end

  def update
    @genre.update(update_genre_params)
    redirect_to admin_rights_path
  end

  def destroy
    @genre.destroy
    redirect_to admin_rights_path
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
  	params.require(:genre).permit(:id, :genre, items_attributes:[:cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status, :id], disks_attributes:[:id, :disk, :item_id], musics_attributes:[:id, :disk_id, :muscic_title, :songwriter, :composer])
  end

  def update_genre_params
    params.require(:genre).permit(:id, :genre, items_attributes:[:cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status, :_destroy, :id], disks_attributes:[:disk, :item_id, :_destroy, :id], musics_attributes:[:disk_id, :muscic_title, :songwriter, :composer,:_destroy, :id])
  end
end
