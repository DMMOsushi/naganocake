# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_public
    @public = Public.find_by(email: params[:public][:email])
    if @public
      if @public.valid_password?(params[:public][:password]) && (@public.user_status == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_public_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
