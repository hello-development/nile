class ArtistsController < ApplicationController

	def index
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
