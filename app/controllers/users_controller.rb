class UsersController < ApplicationController
	def index
	end

	def show
		@users = User.all
	end

	def edit
	end

	def update
	end



	def new
	end

	def create
		@user = User.new(user_params)
		@user.user_id = current_user.id
    if  @user.save
        redirect_to new_user_address_path(@user.id)
    else
    	@users = User.all
    	@user = current_user
	    render :new
	end
	end

	def destroy
	end
end
