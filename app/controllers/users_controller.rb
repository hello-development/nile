class UsersController < ApplicationController
  before_action :cart_destroy!, only: [:destroy]

  def show
    @user = User.find(params[:id])
    @review = Review.new
    unless @user.artist_id.nil?
      @artist = @user.artist
      @item = Item.where(artist_id: @artist.id).limit(1).order('created_at desc')
    end
    @genre = Genre.limit(1).order('created_at desc')
    @purchases = @user.purchases
    @rank = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @cart_item =CartItem.new
    unless admin_signed_in?
      if user_signed_in?
        if current_user.last_sign_in_at == current_user.current_sign_in_at
          unless Address.exists?(user_id: current_user.id)
            redirect_to new_user_address_path(current_user) and return
          end
        end
        if @user.id != current_user.id
          redirect_to user_path(current_user) and return
        end
      else
      redirect_to new_user_session_path and return
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    unless admin_signed_in?
      if user_signed_in?
        if current_user.last_sign_in_at == current_user.current_sign_in_at
          unless Address.exists?(user_id: current_user.id)
            redirect_to new_user_address_path(current_user) and return
          end
        end
        if @user.id != current_user.id
          redirect_to edit_user_path(current_user) and return
        end
      else
        redirect_to new_user_session_path and return
      end
    end
  end

  def update
   user = User.find(params[:id])
    unless admin_signed_in?
      unless user_signed_in?
        redirect_to new_user_session_path and return
      end
    end
    if user.update(user_params)
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if admin_signed_in?
      user.destroy
      redirect_to users_path
    else
      if user_signed_in?
        user.destroy
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end
  end

  def favorite
    if admin_signed_in?
      redirect_to artists_path
      flash[:alert]="管理者はお気に入り出来ません"
    else
      if user_signed_in?
        @artist = Artist.find(params[:id])
        @user = current_user
        if @user.artist_id == @artist.id
        # 現在のアーティストIDと登録したいIDが同じ時にnilにしてupdateする
          @user.artist_id = nil
          @user.update(artist_id: nil)
          # artist_id:にnilを入れてupdate
          redirect_to artist_path(@artist.id)
        else
          @user.update(artist_id: @artist.id)
          # artist_id:に@artist.id(参照してきたid)を入れてupdate
          redirect_to artist_path(@artist.id)
          flash[:notice]="お気に入りに登録しました！"
        end
      end
    end
  end

  def index
    @users = User.all
    @rank = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    # group(:item_id)で、アイテムの番号が同じものにグループを分ける
    # order('count(item_id) desc')で、番号の多い順に並び替える
    # limit()で、表示する最大数を指定して
    # pluck(:item_id)で:item_idカラムのみを取り出すように指定。
    # Item.find(integer)最終的に、取り出される数値オブジェクトをアイテムのIDとすることで表示される
    if admin_signed_in?
      if params[:last_name].present?
        @users = @users.get_by_last_name params[:last_name]
      end
      if params[:first_name].present?
        @users = @users.get_by_first_name params[:first_name]
      end
      unless @users.count == User.all.count
      # @usersの数がUser.allから変わっているか確認する
        if @users.count == 0
        # usersの数が０の時
          flash.now[:notice] = "ヒットしませんでした。検索ワードを変えてみて下さい。"
          render :action => :index, layout: "user_index" and return
          # renderにする事で変更された情報を維持しつつnoticeを表示させる
        elsif @users.count > 0
          flash.now[:notice] = "#{@users.count}件のユーザーがヒットしました。"
          #{@users.count}で絞り込まれた数を表示させる
          render :action => :index, layout: "user_index" and return
          # renderにする事で変更された情報を維持しつつnoticeを表示させる
        end
      end
      render :index, layout: "user_index" and return
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:phone_number,:email,:artist_id)
    end

    def cart_destroy!
      cart = Cart.find_by(user_id: current_user)
      unless cart.nil? #cartがnilでなければ(つまりcartが存在していれば)
        if cart.cart_items.nil? #カートの中は空ですか？空ならカート消しても良いからdestroy
          cart.destroy
        else
          redirect_to user_path(current_user)
          flash[:alert]="あなたのカートに商品が存在しています。退会する前に確認して下さい。"
        end
      end
    end
end