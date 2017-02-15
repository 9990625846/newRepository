class PhotosController < ApplicationController

  before_action :find_album, only: [:show, :edit, :update, :destroy]

	def index
    @photos=Photo.where(:album_id => params[:album_id])
 	end

  def new
   	@photo = Photo.new
  end

  def create
    @album = Album.find(params[:album_id])
   	@photo = @album.photos.new(photo_params)
    	if @photo.save
       
        @photo.tags.create(tag_params[:text].split(",").map{ |i| { :text => i.strip } }
)
     
  		  flash[:success] = "The photo was added!"
   		  redirect_to  album_photo_path(@album, @photo), notice: "The photo was added!"
    	else
     		render 'new'
      end
  end

  def show
    @photo =Photo.find(params[:id])
  end
    
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to album_path(@album, @photo), notice:  "The photo #{@photo.title} has been deleted."
  end

  private

  def photo_params
  
    params.require(:photo).permit(:image, :title)
  end
  def tag_params
 
  	params.require(:photo).permit(:text)
  end

  def find_album
    @album=Photo.find(params[:id]).album_id
  end
end


