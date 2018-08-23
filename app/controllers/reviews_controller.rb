class ReviewsController < ApplicationController

	def create
		@item = Item.find(params[:item_id])
		@review = current_user.reviews.new(review_params)
		@review.item_id = @item.id
		if @review.save
			redirect_to item_path(@item)
		else
			@items = Item.all
			# 別のコントローラーアクションにrenderする場合アクションに記入されているの変数を持ってこないといけない
			@review = Review.new
			@artists = Artist.all
			@genres = Genre.all
			@labels = Label.all
			@disks = Disk.all
			@songs = Song.all
			@cart_item =CartItem.new
			@likes = Like.all
			@rank = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(10).pluck(:item_id))			
			flash.now[:notice] = "100文字以内で投稿してください"
			render :template => 'items/show'
		end
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
