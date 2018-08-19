class UsersController < ApplicationController
	before_action :authenticate_user!
	# before_action :authenticate_user!, except: [:top, :about, :new_user_session_path, :new_user_registration_path]

	def index
		@user = User.all
	end

	def show
		@user = User.all
	end

	def edit
	end

	def update
	end

	def new
	end

	def create
		# @user = User.new(user_params)
		@user = User.all
		@user.user_id = current_user.id
    if  @user.save
        redirect_to new_user_address_path(@user.id)
    else
    	@user = User.all
    	# @user = current_user
	    render :new
	end
	end

	def destroy
	end

	def favorite
		@artist = Artist.find(params[:id])
		@user = current_user
		if  @user.artist_id == @artist.id
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

	private
	def user_params
		params.require(:user).permit(:artist_id)
	end

end