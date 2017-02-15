class AlbumsController < ApplicationController

	before_action :find_album, only: [:show, :edit, :destroy, :find_photo, :searchByTag]
	before_action :find_photo, only: [ :searchByTag]
	def index
		@albums = Album.all
	end

	def show

		@photos= @album.photos
	end

	def new
		@album = Album.new
	end

	def create
		
		@album = Album.new(album_params)
	
		if @album.save
			
			redirect_to albums_path
		else
			render 'new'
		end
	end
	
	def destroy
	 @album = Album.find(params[:id])
     @album.destroy
     redirect_to albums_path, notice:  "The album #{@album.name} has been deleted."
	end

	def searchByTag
	
		@tags= Tag.where(:text=>params[:search])

	
	end

	private
	
	def  find_album
	
		@album =Album.find(params[:id])
	end

	def find_photo
			
		@photo=Photo.find(params[:id])
	end
	
	def album_params
		params.require(:album).permit(:name, :description)
	end
end
