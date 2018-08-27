class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    cart_items = current_cart.cart_items
    if cart_items.blank? #ブラウザバックされた時を想定
      redirect_to user_carts_path(current_user)
      flash[:notice]="カートに商品がありませんでした。購入する商品をカートに入れて下さい。"
    else
      cart_items.each do |cart_item|
        if cart_item.units > cart_item.item.inventory #他のユーザーの購入により在庫が足りなくなった時を想定
          redirect_to user_carts_path(current_user)
          flash[:alert]="売り切れまたは在庫が足りなくなった商品がございます。恐れ入りますが注文数量を確認して下さい。" and return
        end
      end
      purchase = Purchase.new(purchase_params)
      purchase.user_id = current_user.id
      sum = 0 #sum初期化
      cart_items.each do |cart_item|
        sum += cart_item.units * cart_item.item.price #合計を計算しています
      end
      purchase.purchased_date = Time.now
      tax_included = sum * tax #taxはapplication_controllerから呼び出しています
      purchase.total_price = tax_included.round #.roundで小数点を切り上げた税込の値をtotal_priceに入れています
      purchase.save
      cart_items.each do |cart_item| #cart_itemを１つずつ取り出しpurchase_datailをcreateします
        PurchaseDatail.create( purchase_id: purchase.id, purchase_date: purchase.purchased_date,
                               item_id: cart_item.item.id, price: cart_item.item.price, quantity: cart_item.units )
        item = cart_item.item
        item.inventory -= cart_item.units #商品の在庫を減らして保存します
        item.save
      end
      current_cart.cart_items.delete_all #current_cartのcart_item全て削除します
      redirect_to user_path(current_user)
      flash[:notice]="ご注文ありがとうございました！注文内容は下記をご確認下さい。"
    end
  end

  def index
    unless admin_signed_in?
      redirect_to root_path and return
    end
    @purchases = Purchase.all
  end

  def update
    purchase = Purchase.find(params[:id])
    purchase.update(purchase_params)
    redirect_to purchases_path
  end

    private
      def purchase_params
        params.require(:purchase).permit(:purchased_date, :total_price,
                                         :status, :delivery_address, :user_id)
      end

      def purchase_datail_params
        params.require(:purchase_datail).permit(:item_id, :price, :quantity,
                                                :purchase_id, :purchase_date)
      end
end
