class PurchaseDatailsController < ApplicationController
	def confirmation
	  cart_items = current_cart.cart_items
	  cart_items.each do |cart_item| #cart_itemを１つずつ取り出し下記を毎回実行します
	  	purchase = Purchase.last #直前に作ったpurchaseを呼び出して代入しています
	    purchase_datail = PurchaseDatail.new #新しいpurchase_datailを用意してカラムにデータを入れていきます
	    purchase_datail.purchase_id = purchase.id
	    purchase_datail.purchase_date = purchase.purchased_date
	    purchase_datail.item_id = cart_item.item.id
	    purchase_datail.price = cart_item.item.price
	    purchase_datail.quantity = cart_item.units
	    purchase_datail.save #データを入れ終わりましたので保存します
	  end
	  current_cart.cart_items.delete_all #current_cartのcart_item全て削除します
	  redirect_to user_path(current_user)
    end


	  private
      def purchase_datail_params
	      params.require(:purchase_datail).permit(:item_id, :price, :quantity,
	                                              :purchase_id, :purchase_date)
      end
end