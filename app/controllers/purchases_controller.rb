class PurchasesController < ApplicationController
  def create
  	purchase = Purchase.new(purchase_params)
  	purchase.user_id = current_user.id
    sum = 0
	  cart_items = current_cart.cart_items
	  cart_items.each do |cart_item|
	    sum = cart_item.units * cart_item.item.price + sum
    end
    taxincl = sum * 1.08
    purchase.total_price = taxincl.round
    purchase.purchased_date = Time.now
    purchase.save
    redirect_to purchase_purchase_datails_path(purchase.id)
  end


	  private
      def purchase_params
	      params.require(:purchase).permit(:purchased_date, :total_price,
	                                       :status, :delivery_address, :user_id)
      end
end
