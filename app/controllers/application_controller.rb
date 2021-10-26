class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session


  #def after_sign_in_path_for(resource)
    #case resource

    #when Admin
      #top_path
    #when Public
      #root_path
    #end
  #end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Public)
        root_path
    elsif resource_or_scope.is_a?(Admin)
        admin_orders_path
    end
  end


  def after_sign_up_path_for(resource)
    case resource

    when Admin
      admin_items_path
    when Public
      public_customer_path(@public)
    end
  end

  def after_sign_out_path_for(resource)

    if resource == :admin
      new_admin_session_path
    else
      root_path
    end

  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:address,:postalcode,:telephone])
  end

end

