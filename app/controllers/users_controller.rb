class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	# before_action :authenticate_user!, except: [:top, :about, :new_user_session_path, :new_user_registration_path]

	def index
		@users = User.all
		if admin_signed_in?
		if params[:last_name].present?
			@users = @users.get_by_last_name params[:last_name]
		end
		if params[:first_name].present?
			@users = @users.get_by_first_name params[:first_name]
		end
		elsif user_signed_in?
			redirect_to root_path
		else
			redirect_to root_path
		end
		# @user = User.find(params[:id])
	end

	def show
		@user = User.all
				if user_signed_in?
		if current_user.last_sign_in_at == current_user.current_sign_in_at
		unless Address.exists?(user_id: current_user.id)
			redirect_to new_user_address_path(current_user)
		end
		end
		end
	end

	def edit
		if admin_signed_in?
		elsif user_signed_in?
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def update
	end

	def new
	end

	def create
		@user = User.all
		@user.user_id = current_user.id
    if  @user.save
        redirect_to new_user_address_path(@user.id)
    else
    	@user = User.all
	    render :new
	end
	end

	def destroy
		# @user = User.find(params[:id])
  #   	@user.destroy
    	redirect_to root_path
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
		params.require(:user).permit(:artist_id, :user_id)
	end

end