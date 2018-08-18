class AddressesController < ApplicationController
	def new
      @user = User.find params[:user_id]
	  @address = Address.new
	end

	def create
	  @user = User.find params[:user_id]
	  @address = Address.new(address_params)
	  @address.user_id = @user.id
	  address_name = @user.last_name + @user.first_name
	  @address.address_name = address_name if @address.address_name.nil?
	  if @address.save
	  	redirect_to user_path(@user)
	  else
	  	render :new
	  end
	end



   private
     def address_params
       params.require(:address).permit(:postal_code, :address, :address_name, :use_id)
     end
end
