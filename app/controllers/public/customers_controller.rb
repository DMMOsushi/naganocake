class Public::CustomersController < ApplicationController
  def show
    @public = current_public
    @publics = Public.all
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    public = Public.find(params[:id])
    public.update(public_params)
    redirect_to public_customer_path(public.id)
  end

  def unsubscribe
    @public = Public.find(params[:id])
    redirect_to public_confirm_unsubscribe
  end

  def withdraw
    @public = Public.find(params[:id])
    @public.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :email, :address, :postalcode, :telephone)
  end
end