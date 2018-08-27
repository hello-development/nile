class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @user = User.find(params[:user_id])
    @address.user_id = @user.id
    # 宛名に氏名（姓＋名）を入れます、宛名が空欄の時は
    @address.address_name = @user.last_name + @user.first_name if @address.address_name.blank?
    if @address.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @address = Address.new
    @user = User.find(params[:user_id])
    # @addresses = current_user.addresses
    @addresses = @user.addresses
  end

  def edit
    @address = Address.find(params[:id])
    @user = User.find(params[:user_id])
    # @address = Address.find_by(user_id: params[:user_id], id: params[:id])
  end

  def update
    @address = Address.find_by(user_id: params[:user_id], id: params[:id])
    @user = User.find(params[:user_id])

    if @address.update(address_params) #一旦更新します。その後宛名に氏名（姓＋名）を入れます、宛名が空欄の時は
      @address.address_name = @user.last_name + @user.first_name if @address.address_name.blank?
      @address.save #宛名が入りましたので保存します
      redirect_to user_address_path(@user, @address)
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find_by(user_id: params[:user_id], id: params[:id])
    @user = User.find(params[:user_id])
    @address.destroy
    redirect_to user_address_path(@user, @address)
  end


  private
    def address_params
      params.require(:address).permit(:postal_code, :address, :address_name, :use_id)
    end
end
