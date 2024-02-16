class SongsController < ApplicationController

  # omplete the controller code using the correct params key?
  # HTTP request: GET /search?query=thriller
  # Routing in config/routes.rb: get "/search" => "songs#search"

  # '/search?query=thriller'
  def search
    # @songs = Song.where(title: params[:query])
    @songs = Song.where('title ILIKE ?', "%#{params[:query]}%")
  end

  # 'get "/songs/named/:name"'
  def search
    # @songs = Song.where(title: params[:name])
    @songs = Song.where('title ILIKE ?', "%#{params[:name]}%")
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
