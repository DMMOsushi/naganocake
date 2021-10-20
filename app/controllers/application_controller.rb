class ApplicationController < ActionController::Base
<<<<<<< HEAD
    before_action :configure_permitted_parameters, if: :devise_controller?
=======
  before_action :configure_permitted_parameters, if: :devise_controller?
>>>>>>> 4ff6ceffb167b1fce78a47ae8a3aa9ff91550ea7

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana_name,:first_kana_name,:address,:postalcode,:telephone])
  end
end

