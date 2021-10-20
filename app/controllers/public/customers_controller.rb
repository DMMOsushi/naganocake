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
    @public = Public.find_by(email: params[:public][:email])
    redirect_to public_customers_unsubscribe_path
  end

  def withdraw
    @public = Public.find_by(name: params[:name])
    @public.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :address, :postalcode, :telephone)
  end
end