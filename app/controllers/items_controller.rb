class ItemsController < ApplicationController

	layout 'item'

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

		if params[:genre_id].present?
			@items = @items.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@items = @items.get_by_label_id params[:label_id]
		end
		if params[:item_name].present?
			@items = @items.get_by_item_name params[:item_name]
		end

	end

	def new
		@item = Item.new
		@items = Item.all
		# @artists = Artist.all
		# @genres = Genre.all
		# @labels = Label.all
		if params[:item_name].present?
			@items = @items.get_by_item_name params[:item_name]
		end
		render :new, layout: "item_new"
	end
	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to item_disks_path(@item.id)
			flash[:notice]="商品の登録ができました"
		else
			@items = Item.all
			render :new
		end
	end

	def show
		@item = Item.find(params[:id])
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all
		@disks = Disk.all
		@songs = Song.all
		# @cart_item = current_cart.cart_item.find(params[:item_id])
	end

	def admin_index
		@items = Item.all
		@item = Item.new
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all
		if params[:genre_id].present?
			@items = @items.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@items = @items.get_by_label_id params[:label_id]
		end
		if params[:item_name].present?
			@items = @items.get_by_item_name params[:item_name]
		end
		render :admin_index, layout: "admin_item"
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