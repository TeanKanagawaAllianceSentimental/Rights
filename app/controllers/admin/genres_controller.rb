class Admin::GenresController < Admin::AdminBase
  before_action :set_genre, only: [:edit, :update, :destroy]

  def index
    @genres = Genre.all
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
    if @genre.invalid?
      flash.now[:error] = '入力内容を再度ご確認ください'
      render :new
    else
      @genre.save(genre_params)
      flash[:success] = 'ご登録ありがとうございます'
      redirect_to admin_rights_path
    end
  end

  def edit
  end

  def update
    if @genre.invalid?
      flash.now[:error] = '入力内容を再度ご確認ください'
      render :edit
    else
      @genre.update(update_genre_params)
      flash[:success] = '編集が完了いたしました'
      redirect_to admin_rights_path
    end
  end

  def destroy
    @genre.destroy
    flash[:success] = '削除が完了いたしました'
    redirect_to admin_rights_path
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
  	params.require(:genre).permit(:id, :genre, items_attributes:[:cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status, :id, disks_attributes:[:id, :disk, :item_id, musics_attributes:[:id, :disk_id, :music_title, :songwriter, :composer]]])
  end

  def update_genre_params
    params.require(:genre).permit(:id, :genre, items_attributes:[:cd_title, :genre_id, :package, :artist, :jacket_image, :label, :unit_price, :caption, :about, :stock_quantity, :status, :_destroy, :id], disks_attributes:[:disk, :item_id, :_destroy, :id], musics_attributes:[:disk_id, :muscic_title, :songwriter, :composer,:_destroy, :id])
  end
end
