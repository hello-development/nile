class ArtistsController < ApplicationController

	def admin_index
		@artists = Artist.all
		@artist = Artist.new
	end

	def index
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all
		if params[:genre_id].present?
			@artists = @artists.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@artists = @artists.get_by_label_id params[:label_id]
		end
				if user_signed_in?
		if current_user.last_sign_in_at == current_user.current_sign_in_at
		unless Address.exists?(user_id: current_user.id)
			redirect_to new_user_address_path(current_user)
		end
		end
		end
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			redirect_to artists_admin_index_path
			flash[:notice]="アーティストの登録ができました"
		else
			@artists =Artist.all
			render :admin_index
		end
	end

	def show
		@artist = Artist.find(params[:id])
		@genres = Genre.all
		@labels = Label.all
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])
		if @artist.update(artist_params)
			redirect_to artist_path(@artist.id)
			flash[:notice]="アーティストの更新ができました"
		else
			render :edit
		end
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy
		redirect_to artists_admin_index_path
	end

	private
	def artist_params
		params.require(:artist).permit(:artist_name, :artist_image, :artist_contents,:genre_id, :label_id)
	end
end
