class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include CurrentCart
	before_action :set_cart
  
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # private

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  # end
    
end
