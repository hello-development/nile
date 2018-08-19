class ItemsController < ApplicationController

	def index
			@items = Item.all
			@item = Item.new
			@artists = Artist.all
			@genres = Genre.all
			@labels = Label.all
		if user_signed_in?
		unless Address.exists?(user_id: current_user.id)
			redirect_to new_user_address_path(current_user)
		end
		end
	end

	def new
		@item = Item.new
	end
	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to items_admin_index_path
	end

	def show
		@item = Item.find(params[:id])
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
		@artists = Artist.find(params[:id])
		@genres = Genre.find(params[:id])
		@labels = Label.find(params[:id])
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