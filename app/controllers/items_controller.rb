class ItemsController < ApplicationController

	def index
			@items = Item.all
			@item = Item.new
			@artists = Artist.all
			@genres = Genre.all
			@labels = Label.all
			# render layout: "item"
		if params[:genre_id].present?
			@items = @items.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@items = @items.get_by_label_id params[:label_id]
		end
		if params[:item_name].present?
			@items = @items.get_by_item_name params[:item_name]
		end

		unless @items.count == Item.all.count
			# itemsの数がitems.allから変わっているか確認する
		if @items.count == 0
			# itemsの数が０の時
			flash.now[:notice] = "ヒットしませんでした。検索ワードを変えてみて下さい。"
			render :action => :index, layout: "item" and return
			# indexに戻りitemのレイアウトを適用させる。renderをもう一度使いたいためreturnする。
		elsif @items.count > 0

          	flash.now[:notice] = "#{@items.count}件のCDがヒットしました。"
          	#{@items.count}で絞り込まれた数を表示させる

          	render :action => :index, layout: "item" and return
          	# renderにする事で変更された情報を維持しつつnoticeを表示させる
		end
		end

		if user_signed_in?
		if current_user.last_sign_in_at == current_user.current_sign_in_at
		unless Address.exists?(user_id: current_user.id)
			redirect_to new_user_address_path(current_user)
		end
		end
		end

		render :index, layout: "item"
		# itemのレイアウトを適用させる。
	end

	def new
		@item = Item.new
		@items = Item.all
		# @artists = Artist.all
		# @genres = Genre.all
		# @labels = Label.all
		if params[:genre_id].present?
			@items = @items.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@items = @items.get_by_label_id params[:label_id]
		end
		if params[:item_name].present?
			@items = @items.get_by_item_name params[:item_name]
		end

		unless @items.count == Item.all.count
			# itemsの数がitems.allから変わっているか確認する
		if @items.count == 0
			# itemsの数が０の時
			flash.now[:notice] = "ヒットしませんでした。検索ワードを変えてみて下さい。"
			render :action => :new, layout: "item_new" and return
			# newに戻りitem_newのレイアウトを適用させる。renderをもう一度使いたいためreturnする。
		elsif @items.count > 0

          	flash.now[:notice] = "#{@items.count}件のCDがヒットしました。"
          	#{@items.count}で絞り込まれた数を表示させる

          	render :action => :new, layout: "item_new" and return
          	# renderにする事で変更された情報を維持しつつnoticeを表示させる
		end
		end

		render :new, layout: "item_new"
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to item_disks_path(@item.id)
			flash[:notice]="商品の登録ができました"
		else
			@items = Item.all
			render :new
		end
	end

	def show
		@item = Item.find(params[:id])
		@review = Review.new
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all
		@disks = Disk.all
		@songs = Song.all
		@cart_item = CartItem.new
	end

	def admin_index

		@items = Item.all
		@item = Item.new
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all
		if params[:genre_id].present?
			@items = @items.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@items = @items.get_by_label_id params[:label_id]
		end
		if params[:item_name].present?
			@items = @items.get_by_item_name params[:item_name]
		end

		unless @items.count == Item.all.count
			# itemsの数がitems.allから変わっているか確認する
		if @items.count == 0
			# itemsの数が０の時
			flash.now[:notice] = "ヒットしませんでした。検索ワードを変えてみて下さい。"
			render :action => :admin_index, layout: "admin_item" and return
			# admin_indexに戻りadmin_itemのレイアウトを適用させる。renderをもう一度使いたいためreturnする。
		elsif @items.count > 0

          	flash.now[:notice] = "#{@items.count}件のCDがヒットしました。"
          	#{@items.count}で絞り込まれた数を表示させる

          	render :action => :admin_index, layout: "admin_item" and return
          	# renderにする事で変更された情報を維持しつつnoticeを表示させる
		end
		end
		render :admin_index, layout: "admin_item"
		# admin_itemのレイアウトを適用させる。
	end

	def edit
		@item = Item.find(params[:id])
		# @artists = Artist.find(params[:id])
		# @genres = Genre.find(params[:id])
		# @labels = Label.find(params[:id])
	end


	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to items_admin_index_path
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_admin_index_path
	end

	private
	def item_params
		params.require(:item).permit(:item_name, :artist_id, :genre_id, :price, :inventory, :item_contents, :label_id, :item_image)
	end

end
