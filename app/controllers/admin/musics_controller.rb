class Admin::MusicsController < Admin::AdminBase
  def index
  end

  def new
    @music = Music.new
  end

  def show
  end


  def edit
  end

  private
  def music_params
  	params.require(:music).permit(:id, :disk_id, :music_title, :composer, :songwriter)
  end
end
