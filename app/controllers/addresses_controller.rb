class AddressesController < ApplicationController
	def new
      @user = User.find params[:user_id]
	  @address = Address.new
	end
end
