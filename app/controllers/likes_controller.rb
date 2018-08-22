class LikesController < ApplicationController

	def create
		@item = Item.find(params[:item_id])
		@like = current_user.likes.new(item_id: @item.id)
		@like.save
		# redirect_to item_path(@item)
		@item.reload
		respond_to do |format|
  	      format.html { render @item }
  	      format.js
  	    end
	end
	def destroy
		@item = Item.find(params[:item_id])
		@like = current_user.likes.find_by(item_id: params[:item_id])
		@like.destroy
		# redirect_to item_path(@item)
		@item.reload
		respond_to do |format|
  	      format.html { render @item }
  	      format.js
  	    end
	end

end
