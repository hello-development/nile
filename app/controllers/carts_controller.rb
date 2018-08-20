class CartsController < ApplicationController
	before_action :authenticate_user!
	before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

	def show
		 @cart_items = current_cart.cart_items
	end

	# 商品一覧画面から、「商品購入」を押した時のアクション
	#先にsetup_cart_item!を実行するよ！
	def add_item
	  if @cart_item.present?  #@cart_itemが存在していますか？(同じ商品がカゴに入っているかどうか聞いています)
	  	@cart_item.units += 1 #存在していれば１個足します
	  else                    #存在していなければ(新しい商品ということです)１個カゴに入れます
	    @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
		@cart_item.units = 1 #params[:units].to_i
      end
	  @cart_item.save
	  redirect_to user_carts_path(current_user)
	end

	# カート詳細画面から、「更新」を押した時のアクション
	def update_item
		@cart_item.update(units: params[:units].to_i)
		redirect_to user_carts_path(current_user)
	end

	# # カート詳細画面から、「削除」を押した時のアクション
	def delete_item
		@cart_item.destroy
		redirect_to user_carts_path(current_user)
	end

	def register
	end

	private

	def setup_cart_item!
		@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id]) #買いたい商品をfind_byで取り出して@cart_itemに代入します
	end
end

