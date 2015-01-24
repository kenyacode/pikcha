class AlbumsController < ApplicationController
  def index 
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @album.photos.build
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to album_path(@album)

    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to album_path
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to albums_path
    else
      render "edit"
    end
  end

  private
    def album_params
      params.require(:album).permit(:name, :desc, :date)
    end
end