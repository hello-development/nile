class PurchasesController < ApplicationController
  def create
  	purchase = Purchase.new(purchase_params)
  	purchase.user_id = current_user.id
    sum = 0
	  cart_items = current_cart.cart_items
	  cart_items.each do |cart_item|
	    sum = cart_item.units * cart_item.item.price + sum #合計を計算しています
    end
    taxincl = sum * 1.08
    purchase.total_price = taxincl.round #.roundで小数点を切り上げた税込の値をtotal_priceに入れています
    purchase.purchased_date = Time.now
    purchase.save
    redirect_to confirmation_path(purchase) #purchase_datailsコントローラーのconfirmationアクションにいきます
  end


	  private
      def purchase_params
	      params.require(:purchase).permit(:purchased_date, :total_price,
	                                       :status, :delivery_address, :user_id)
      end
end
