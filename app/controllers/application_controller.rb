class ApplicationController < ActionController::Base
	# ここ削除しないと、loginから管理者topに行けない？
	# before_action :authenticate_user!, except: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email]

	protect_from_forgery with: :exception
  	before_action :configure_permitted_parameters, if: :devise_controller?

  	def after_sign_in_path_for(resource)
  		if admin_signed_in?
  			items_admin_index_path
  		elsif user_signed_in?
  			items_path
  		else
  			items_path
	 	end
	end

	def after_sign_out_path_for(resource)
	 items_path
	end

	protected
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email])
  	end
end