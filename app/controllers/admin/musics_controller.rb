class Admin::MusicsController < Admin::AdminBase
  def index
    @musics = Music.all
    @music = Music.new
  end

  def new
    @music = Music.new
  end

  def show
  end

  def create
    @music = Music.new(music_params)
    @music.save
    redirect_to admin_musics_path
  end

  def edit
  end

  private
  def music_params
  	params.require(:music).permit(:id, :music_title, :composer, :songwriter)
  end
end
