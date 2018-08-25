class CartsController < ApplicationController
	before_action :authenticate_user!
	before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

	def show
	  @cart_items = current_cart.cart_items
	  unless Address.exists?(user_id: current_user.id)
	    redirect_to new_user_address_path(current_user)
	    flash[:notice]="住所を登録して下さい" and return
	  end
	end


	# 「カートに入れる」を押した時のアクション
	def add_item
	  item = Item.find(params[:item_id])
	  if cart_item_params[:units].to_i <= 0
	    redirect_to item_path(item)
		flash[:alert]="数量が正しくありません" and return
	  end
	  if @cart_item.nil? #setup_cart_item!の結果がnilかどうか聞いています。nilなら新しいcart_itemを作ります。
	    cart_item = CartItem.new(cart_item_params)
	    if cart_item.units > item.inventory
	      redirect_to item_path(item)
		  flash[:alert]="申し訳ありませんが在庫以上のご注文は承ることができません" and return
		else
	  	  cart_item.item_id = item.id
	  	  cart_item.cart_id = current_cart.id
	  	  cart_item.save
	  	end
	  else               #nilでなければ同じ商品がカートに入っているということなので数量を足します
	   	additem = CartItem.new(cart_item_params)
	   	if additem.units + @cart_item.units > item.inventory
	   	  redirect_to user_carts_path(current_user)
		  flash[:alert]="申し訳ありませんが在庫以上のご注文は承ることができません" and return
		else
          @cart_item.units += additem.units
          @cart_item.save
        end
	  end
	  redirect_to user_carts_path(current_user)
	end

	# カート画面で「この数量で更新」を押した時のアクション
	def update_item
      if cart_item_params[:units].to_i == 0
      	@cart_item.destroy
        redirect_to user_carts_path(current_user)
	    flash[:notice]="商品を戻しました"
	  elsif cart_item_params[:units].to_i > @cart_item.item.inventory
	  	redirect_to user_carts_path(current_user)
		flash[:alert]="申し訳ありませんが在庫以上のご注文は承ることができません"
	  else
	    if @cart_item.update(cart_item_params)
	      redirect_to user_carts_path(current_user), notice: "更新しました！"
	    else
	  	  @items = Item.all
	      @cart_items = current_cart.cart_items
	  	  flash.now[:alert] = "数量が正しくなかったため更新できませんでした"
	  	  render :show
	    end
	  end
	end

	 # カート画面で「削除」を押した時のアクション
	def delete_item
	  @cart_item.destroy
	  redirect_to user_carts_path(current_user)
	  flash[:notice]="商品を戻しました"
	end

	def delete_all
	  cart_items = current_cart.cart_items
	  cart_items.delete_all
	  redirect_to user_carts_path(current_user)
	  flash[:notice]="カートを空にしました"
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