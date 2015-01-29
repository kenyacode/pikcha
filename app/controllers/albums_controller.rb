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
    # if !photo_params.nil?
    #   photo_params[:image].each {|p| @album.photos.new(image: p)}
    # end

    if @album.save
      redirect_to photos_path(@photo)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def destroy
  end

  def update
  end
  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end

  private
    def album_params
      params.require(:album).permit(:photo, :name, :desc, :date)
    end
    def photo_params
      params.require(:album).fetch(:photo, {}).permit(:caption, :image => [])
    end
end