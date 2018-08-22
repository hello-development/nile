class ReviewsController < ApplicationController

	def create
		@item = Item.find(params[:item_id])
		@review = current_user.reviews.new(review_params)
		@review.item_id = @item.id
		@review.save
		redirect_to item_path(@item)
	end

	def destroy
		@item = Item.find(params[:item_id])
		@review = Review.find_by(item_id: params[:item_id], id: params[:id])
		@review.destroy
		redirect_to item_path(@item)
	end

	private
	def review_params
		params.require(:review).permit(:user_id, :item_id, :comment)		
	end

end
