class TagsController < ApplicationController

	def index
		debugger
		@tags=Tag.where(:photo_id => params[:photo_id])
		debugger

	 end

	 def new 

	 	@tag=Tag.new

	 end

	 def show
	 	debugger


	 end
	 	
end
