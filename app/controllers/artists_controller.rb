class ArtistsController < ApplicationController

	def admin_index
		@artists = Artist.all
		@artist = Artist.new
	end

	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		@artist.save
		redirect_to artists_admin_index_path
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])
		@artist.update(artist_params)
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy
		redirect_to artists_admin_index_path
	end

	private
	def artist_params
		params.require(:artist).permit(:artist_name, :artist_image, :artist_contents)
	end
end
