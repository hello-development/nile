class CartsController < ApplicationController
	before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

	def show
		# cart_itemsがnilでエラー
		 # @cart_items = current_cart.cart_items
	end

	# 商品一覧画面から、「商品購入」を押した時のアクション
	def add_item
		if @cart_item.blank?
			@cart_item = current_cart.cart_items.build(item_id: params[:item_id])
		end
		@cart_item.units += params[:units].to_i
		@cart_item.save
		redirect_to current_cart
	end

	# カート詳細画面から、「更新」を押した時のアクション
	def update_item
		@cart_item.update(units: params[:units].to_i)
		redirect_to current_cart
	end

	# カート詳細画面から、「削除」を押した時のアクション
	def delete_item
		@cart_item.destroy
		redirect_to current_cart
	end

	def register
	end

	private

	def setup_cart_item!
		@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
	end
end
