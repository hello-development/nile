class AddressesController < ApplicationController

  def new
    @address = Address.new
    if admin_signed_in?
      redirect_to items_admin_index_path
    else
      if user_signed_in?
        if current_user.last_sign_in_at == current_user.current_sign_in_at
          if Address.exists?(user_id: current_user.id)
            unless session[:url].blank?
              redirect_to session[:url] and return
            end
            redirect_to user_path(current_user) and return
          end
        else
          unless session[:url].blank?
            redirect_to session[:url] and return
          end
          @user = User.find(params[:user_id])
          if @user.id != current_user.id
            redirect_to new_user_address_path(current_user) and return
          end
        end
      else
        redirect_to new_user_session_path and return
      end
    end
  end

  def create
    @address = Address.new(address_params)
    @user = User.find(params[:user_id])
    @address.user_id = @user.id
    # 宛名に氏名（姓＋名）を入れます、宛名が空欄の時は
    @address.address_name = @user.last_name + @user.first_name if @address.address_name.blank?
    if admin_signed_in?
      if @address.save
        redirect_to user_path(@user)
      else
        render :edit
      end
    elsif user_signed_in?
      if @user.id != current_user.id
        redirect_to user_path(current_user)
      else
        if @address.save
          unless session[:url].blank?
            redirect_to session[:url] and return
          end
          redirect_to user_path(current_user)
        else
          render :edit
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @address = Address.new
    @user = User.find(params[:user_id])
    @addresses = @user.addresses
    unless admin_signed_in?
      if user_signed_in?
        unless Address.exists?(user_id: current_user.id)
          redirect_to new_user_address_path(current_user) and return
        end
        if @user.id != current_user.id
          redirect_to user_address_path(current_user) and return
        end
      else
        redirect_to new_user_session_path and return
      end
    end
  end

  def edit
    @address = Address.find(params[:id])
    @user = User.find(params[:user_id])
    unless admin_signed_in?
      if user_signed_in?
        if @user.id != current_user.id
          redirect_to user_address_path(current_user) and return
        end
      else
        redirect_to new_user_session_path and return
      end
    end
  end

  def update
    @address = Address.find_by(user_id: params[:user_id], id: params[:id])
    @user = User.find(params[:user_id])
    if admin_signed_in?
      if @address.update(address_params) #一旦更新します。その後宛名に氏名（姓＋名）を入れます、宛名が空欄の時は
         @address.address_name = @user.last_name + @user.first_name if @address.address_name.blank?
         @address.save #宛名が入りましたので保存します
         redirect_to user_address_path(@user, @address)
      else
        render :edit
      end
    elsif user_signed_in?
      if @user.id != current_user.id
        redirect_to edit_user_address_path(current_user)
      else
        if @address.update(address_params) #一旦更新します。その後宛名に氏名（姓＋名）を入れます、宛名が空欄の時は
          @address.address_name = @user.last_name + @user.first_name if @address.address_name.blank?
          @address.save #宛名が入りましたので保存します
          redirect_to user_address_path(@user, @address)
        else
          recder :edit
        end
      end
    end
  end

  def destroy
    @address = Address.find_by(user_id: params[:user_id], id: params[:id])
    @user = User.find(params[:user_id])
    if admin_signed_in?
      @address.destroy
      redirect_to user_address_path(@user, @address)
    elsif user_signed_in?
      if @user.id != current_user.id
        redirect_to edit_user_address_path(current_user)
      else
        @address.destroy
        redirect_to user_address_path(@user, @address)
      end
    else
      redirect_to new_user_session_path
    end
  end

  private
    def address_params
      params.require(:address).permit(:postal_code, :address, :address_name, :use_id)
    end
end
