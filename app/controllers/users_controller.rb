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
end