class ItemsController < ApplicationController

	def index
			@items = Item.all
			@item = Item.new
			@artists = Artist.all
			@genres = Genre.all
			@labels = Label.all
		if user_signed_in?
		if current_user.last_sign_in_at == current_user.current_sign_in_at
		unless Address.exists?(user_id: current_user.id)
			redirect_to new_user_address_path(current_user)
		end
		end
		end
	end

	def new
		@item = Item.new
		@items = Item.all
		# @artists = Artist.all
		# @genres = Genre.all
		# @labels = Label.all
	end
	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to item_disks_path(@item.id)
	end

	def show
		@item = Item.find(params[:id])
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all
		@disks = Disk.all
		@songs = Song.all
	end

	def admin_index
		@items = Item.all
		@item = Item.new
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all
	end

	def edit
		@item = Item.find(params[:id])
		# @artists = Artist.find(params[:id])
		# @genres = Genre.find(params[:id])
		# @labels = Label.find(params[:id])
	end


	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to items_admin_index_path
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_admin_index_path
	end

	private
	def item_params
		params.require(:item).permit(:item_name, :artist_id, :genre_id, :price, :inventory, :item_contents, :label_id, :item_image)
	end

end