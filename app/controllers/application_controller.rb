class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email]

	protect_from_forgery with: :exception
  	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_out_path_for(resource)
	 items_path
	end

	protected
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email])
  	end
end
 