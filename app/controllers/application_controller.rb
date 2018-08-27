class ApplicationController < ActionController::Base
  # ここ削除しないと、loginから管理者topに行けない？
  # before_action :authenticate_user!, except: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email]

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if admin_signed_in?
        items_admin_index_path
      elsif user_signed_in?
        items_path
      else
        items_path
      end
    end

    def tax  #消費税の税率を設定しています。税率が変わったらここを変えて下さい。
      # if purchase.purchased_date < 次回の税率変わる時
        tax = 1.08
      # else
        # tax = 1.1
      # end
    end


  helper_method :current_cart

  #どうしてもセッション使いたいならこっちかな〜
  # def current_cart
  #   if current_user.cart.id.present?
  #     session[:cart_id] = current_user.cart.id
  #     @cart = Cart.find(id: session[:cart_id])
  #   else
  #     # @cart = Cart.create
  #     @cart = Cart.create(user_id: current_user.id)
  #     session[:cart_id] = @cart.id
  #   end
  # end

  # セッションではない方法
  def current_cart
    if Cart.find_by(user_id: current_user).present?   #Cartのデータベースの中にcurrent_userのidを持ったcartが存在していますか？
      @cart = Cart.find_by(user_id: current_user)     #存在していたらcurrent_userのidで検索して自分のcartを@cartに代入します
    else
      @cart = Cart.create(user_id: current_user.id)   #存在していなければcurrent_userのidを持ったcartを作成して@cartに代入します
    end
  end

  def after_sign_out_path_for(resource)
   items_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email])
    end
end