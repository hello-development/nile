class CartsController < ApplicationController
	before_action :authenticate_user!
	before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

	def show
	  @cart_items = current_cart.cart_items
	end


	# 「カートに入れる」を押した時のアクション
	#先にsetup_cart_item!を実行するよ！
	def add_item
	  item = Item.find(params[:item_id])
	  if @cart_item.nil? #setup_cart_item!の結果がnilかどうか聞いています。nilなら新しいcart_itemを作ります。
	    cart_item = CartItem.new(cart_item_params)
	  	cart_item.item_id = item.id
	  	cart_item.cart_id = current_cart.id
	  	cart_item.save
	  else               #nilでなければ同じ商品がカートに入っているということなので数量を足します
	   	additem = CartItem.new(cart_item_params)
        @cart_item.units += additem.units
        @cart_item.save
	  end
	  redirect_to user_carts_path(current_user)
	end

	# カート画面で「この数量で更新」を押した時のアクション
	#先にsetup_cart_item!を実行するよ！
	def update_item
	  if @cart_item.update(cart_item_params)
	    redirect_to user_carts_path(current_user), notice: "更新しました！"
	  else
	  	@items = Item.all
	    @cart_items = current_cart.cart_items
	  	flash.now[:alert] = "数量が正しくなかったため更新できませんでした"
	  	render :show
	  end
	end

	 # カート画面で「削除」を押した時のアクション
	 #先にsetup_cart_item!を実行するよ！
	def delete_item
	  @cart_item.destroy
	  redirect_to user_carts_path(current_user)
	end

	def register
	  @purchase = Purchase.new
	  sum = 0 #計算用のsumという変数(sumという名前じゃなくても良いです)の値を0に設定(初期化)しておきます
	  cart_items = current_cart.cart_items
	  cart_items.each do |cart_item|
	  	sum = cart_item.units * cart_item.item.price + sum #cart_itemを１つずつ取り出して小計を計算しsum(合計)に足しています
	  end
	  @sum = sum #sumに小計が全て足された値(つまり合計ですね!)が入っています。viewに値を渡せるようにインスタンス変数に代入しておきます。
	end

	private

	def setup_cart_item!
      # カートの中に入っている商品をitem_idで検索して代入しています。item_idと一致する商品が見つからない場合はnilが代入されます。
	  @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
	end

	def cart_item_params
	  params.require(:cart_item).permit(:cart_id, :item_id, :units)
    end
end