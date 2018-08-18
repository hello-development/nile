class AddressesController < ApplicationController
	def new
	  @address = Address.new
	end

	def create
	  @address = Address.new(address_params)
	  @address.user_id = current_user.id
	  @address.address_name = current_user.last_name + current_user.first_name if @address.address_name.nil?
	  if @address.save
	  	redirect_to user_address_path(current_user, @address)
	  else
	  	render :new
	  end
	end

    def show
      @address = Address.new
      @addresses = current_user.addresses
    end

    def edit
      @address = Address.find(params[:id])
    end

    def update
      @address = Address.find(params[:id])
      if @address.update(address_params)
      	redirect_to user_address_path(current_user, @address)
      else
        render :edit
      end
    end

    def destroy
      @user = current_user
      @address = Address.find_by(user_id: params[:user_id], id: params[:id])
      @address.destroy
      @addresses = current_user.addresses
      redirect_to user_address_path(current_user, @address)
    end


   private
     def address_params
       params.require(:address).permit(:postal_code, :address, :address_name, :use_id)
     end
end
