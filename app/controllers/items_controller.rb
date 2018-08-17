class ItemsController < ApplicationController

	def index
	end

	def new
		@item = Item.new
	end
	def create
		@item = Item.new(item_params)
		@item.save!
		redirect_to items_admin_index_path
	end

	def show
	end

	def admin_index
		@items = Item.all
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
	end


	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_admin_index_path
	end

	private
	def item_params
		params.require(:item).permit(:item_name, :price, :inventory, :item_contents)
	end

end
