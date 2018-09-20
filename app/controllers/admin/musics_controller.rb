class Admin::MusicsController < Admin::AdminBase
  def index
    @musics = Music.all
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  private
  def music_params
  	params.require(:music).permit(:music_title, :composer, :songwriter)
  end
end
