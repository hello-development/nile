class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    # 宛名に氏名（姓＋名）を入れます、宛名が空欄の時は
    @address.address_name = current_user.last_name + current_user.first_name if @address.address_name.blank?
    if @address.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @address = Address.new
    @addresses = current_user.addresses
    # @user = User.find(params[:id])
    # @addresses = @user.id.addresses
  end

  def edit
    @address = Address.find(params[:id])
    # @address = Address.find_by(user_id: params[:user_id], id: params[:id])
  end

  def update
    @address = Address.find_by(user_id: params[:user_id], id: params[:id])

    if @address.update(address_params) #一旦更新します。その後宛名に氏名（姓＋名）を入れます、宛名が空欄の時は
      @address.address_name = current_user.last_name + current_user.first_name if @address.address_name.blank?
      @address.save #宛名が入りましたので保存します
      redirect_to user_address_path(current_user, @address)
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find_by(user_id: params[:user_id], id: params[:id])
    @address.destroy
    redirect_to user_address_path(current_user, @address)
  end


  private
    def address_params
      params.require(:address).permit(:postal_code, :address, :address_name, :use_id)
    end
end
