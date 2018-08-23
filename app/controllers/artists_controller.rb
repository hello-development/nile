class ArtistsController < ApplicationController

	def admin_index
		@artists = Artist.all
		@artist = Artist.new
		if params[:genre_id].present?
			@artists = @artists.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@artists = @artists.get_by_label_id params[:label_id]
		end
		if params[:artist_name].present?
			@artists = @artists.get_by_artist_name params[:artist_name]
		end

		unless @artists.count == Artist.all.count
			# artistsの数がArtist.allから変わっているか確認する
		if @artists.count == 0
			# artistsの数が０の時
			flash.now[:notice] = "ヒットしませんでした。検索ワードを変えてみて下さい。"
            render :action => :admin_index, layout: "admin_artist" and return
		elsif @artists.count > 0

          	flash.now[:notice] = "#{@artists.count}件のアーティストがヒットしました。"
          	#{@artists.count}で絞り込まれた数を表示させる

          	render :action => :admin_index, layout: "admin_artist" and return
          	# renderにする事で変更された情報を維持しつつnoticeを表示させる
		end
		end

		render :admin_index, layout: "admin_artist"
	end

	def index
		@artists = Artist.all
		@genres = Genre.all
		@labels = Label.all

  		@rank = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(20).pluck(:item_id))
  		# group(:item_id)で、アイテムの番号が同じものにグループを分ける
  		# order('count(item_id) desc')で、番号の多い順に並び替える
  		# limit()で、表示する最大数を指定して
  		# pluck(:item_id)で:item_idカラムのみを取り出すように指定。
  		# Item.find(integer)最終的に、取り出される数値オブジェクトをアイテムのIDとすることで表示される

		if params[:genre_id].present?
			@artists = @artists.get_by_genre_id params[:genre_id]
		end
		if params[:label_id].present?
			@artists = @artists.get_by_label_id params[:label_id]
		end
		if params[:artist_name].present?
			@artists = @artists.get_by_artist_name params[:artist_name]
		end

		unless @artists.count == Artist.all.count
			# artistsの数がArtist.allから変わっているか確認する
		if @artists.count == 0
			# artistsの数が０の時
			flash.now[:notice] = "ヒットしませんでした。検索ワードを変えてみて下さい。"
            render :action => :index, layout: "artist" and return
		elsif @artists.count > 0

          	flash.now[:notice] = "#{@artists.count}件のアーティストがヒットしました。"
          	#{@artists.count}で絞り込まれた数を表示させる

          	render :action => :index, layout: "artist" and return
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

		render :index, layout: "artist"
		# artistのレイアウトを適用させる。
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			redirect_to artists_admin_index_path
			flash[:notice]="アーティストの登録ができました"
		else
			@artists =Artist.all
			render :admin_index
		end
	end

	def show
		@artist = Artist.find(params[:id])
		@genres = Genre.all
		@labels = Label.all
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])
		if @artist.update(artist_params)
			redirect_to artist_path(@artist.id)
			flash[:notice]="アーティストの更新ができました"
		else
			render :edit
		end
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy
		redirect_to artists_admin_index_path
	end

	private
	def artist_params
		params.require(:artist).permit(:artist_name, :artist_image, :artist_contents,:genre_id, :label_id)
	end
end
