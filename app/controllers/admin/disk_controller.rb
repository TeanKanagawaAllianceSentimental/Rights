class Admin::DiskController < Admin::AdminBase
  def index
  	@disks = Disk.all
  end

  def new
  end


  def show
  end

  def edit
  end

  private

  def disk_params
  	params.require(:disk).permit(:disk, :item_id, musics_attributes:[:disk_id, :muscic_title, :songwriter, :composer])
  end
end
